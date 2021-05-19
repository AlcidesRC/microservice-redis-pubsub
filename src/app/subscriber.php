<?php

require_once __DIR__ .'/../vendor/autoload.php';

use App\Handlers\DemoEventHandler;
use Monolog\Formatter\LineFormatter;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use PhpRedisPubSub\Interfaces\Message as MessageInterface;
use PhpRedisPubSub\PhpRedisPubSub;
use Predis\Client;

$REGISTERED_EVENTS = [
    DemoEventHandler::eventName() => DemoEventHandler::class,
];

$client = new Client(
    parameters: [
        'scheme'             => env('REDIS__SCHEME', 'tcp'),
        'host'               => env('REDIS__HOST', 'redis'),
        'port'               => env('REDIS__PORT', 6379),
        'database'           => env('REDIS__DB', 0),
        'read_write_timeout' => 0,
    ],
    options: [
        'cluster' => env('REDIS__CLUSTER', 'redis'),
        'prefix'  => env('REDIS__PREFFIX', 'redis_pubsub_database_'),
    ],
);

$handler = new StreamHandler(
    stream: env('MONOLOG__STREAM', 'php://stdout'),
    level: env('MONOLOG__LEVEL', Logger::INFO),
);
$handler->setFormatter(
    new LineFormatter(
        format: "%datetime% %level_name% [ %channel% ]: %message% %context% %extra%\n",
        dateFormat: 'Y-m-d H:i:s,v'
    )
);

$logger = (new Logger(
    name: env('MONOLOG__NAME', 'php-redis-pubsub'),
))->pushHandler(
    handler: $handler
);

(new PhpRedisPubSub(client: $client, logger: $logger))
    ->withHandler(function (MessageInterface $message) use ($logger, $REGISTERED_EVENTS) {
        // Prevent dealing with messages wrongly posted on this channel
        if (! array_key_exists($message->getName(), $REGISTERED_EVENTS)) {
            return;
        }

        $className = $REGISTERED_EVENTS[$message->getName()];

        // Invokable class
        (new $className(logger: $logger, message: $message))();
    })
    ->subscribe(
        env('SUBSCRIBER__SUBSCRIBE_TO_CHANNEL_1', 'channel:name:1'),
        env('SUBSCRIBER__SUBSCRIBE_TO_CHANNEL_2', 'channel:name:2'),
        //...
    );
