<?php

namespace App\Handlers;

use PhpRedisPubSub\Handlers\AbstractHandler;
use PhpRedisPubSub\Interfaces\Message as MessageInterface;
use Psr\Log\LoggerInterface;

class DemoEventHandler extends AbstractHandler
{
    //-----------------------------------------------------------------------------------------------------------------
    // PUBLIC METHODS
    //-----------------------------------------------------------------------------------------------------------------

    /**
     * @return string
     */
    public static function eventName(): string
    {
        return 'demo:event';
    }

    //-----------------------------------------------------------------------------------------------------------------

    /**
     * @return bool
     */
    public function __invoke(): bool
    {
        // Your business logic lands here

        $this->logger->info(
            message: 'DemoEventHandler has been fired!',
            context: [
                'id' => $this->message->id,
            ]
        );

        return true;
    }

    //-----------------------------------------------------------------------------------------------------------------
    //-----------------------------------------------------------------------------------------------------------------
}
