# Dockerized microservice with a custom PHP service

This is an example of a dockerized microservice that implements a custom **PHP Redis PUB/SUB adapter**.

> See [AlcidesRC/php-redis-pubsub](https://github.com/AlcidesRC/php-redis-pubsub) for further details.

## Features

- Usage of multi-stage builds for optimized microservice generation
- Supervisor is defined as main service by default
- Supervisor has been setup to dynamically add new supervised services on-the-fly

## Built With

* [Docker](https://www.docker.com/) - The fastest way to containerize applications on your desktop.
* [Supervisor](http://supervisord.org/) - A Process Control System.
* Make - GNU make utility to maintain groups of programs.

## Getting Started

### Prerequisites

This repository requires Git and Docker for obviously reasons :)

### Installing

```bash
$ git clone https://github.com/AlcidesRC/microservice-redis-pubsub.git
$ make composer-install
```

### Setup

#### Environment variables

In the **docker-compose.yml** you can find the following environment variables:

```yaml
environment:
    - SUBSCRIBER__SUBSCRIBE_TO_CHANNEL_1=channel:name1
    - SUBSCRIBER__SUBSCRIBE_TO_CHANNEL_2=channel:name2
    - MONOLOG__LEVEL=200
    - MONOLOG__NAME=redis-pubsub
    - MONOLOG__STREAM=php://stdout
    - REDIS__CLUSTER=redis
    - REDIS__DB=10
    - REDIS__HOST=redis
    - REDIS__PORT=6380
    - REDIS__PREFFIX=pubsub_database_
    - REDIS__SCHEME=tcp
```

#### Assumptions

- The application log will be sent to **standard output** by default.
- The application log messages will be labelled as **redis-pubsub** to simplify the debugging process.
- Just as an example, the application will make use of the following channels: **channel:name1** and **channel:name2** for PUB/SUB tasks.

### Usage

#### Commands

A *Makefile* is provided with some predefined useful commands:

| Command              | Description                                      |
| -------------------- | ------------------------------------------------ |
| build                | Builds the container(s) service                  |
| up                   | Starts the container(s) in daemonized mode       |
| down                 | Stops the container(s) service                   |
| logs                 | Prints out the container(s) log(s)               |
| bash                 | Opens a bash connection to containerised service |
| ...                  | ...                                              |
| publish-demo-message | Publish an <demo:event> message                  |

#### Build/Start the service

```bash
$ make up
```

#### Check logs

```bash
$ make logs

┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ DISPLAYING LOG OUTPUT FROM SERVICES                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

Attaching to redis-pubsub, microservice-redis-pubsub_redis_1
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/php-fpm.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/php-fpm.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/subscriber.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/subscriber.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Set uid to user 0 succeeded
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Set uid to user 0 succeeded
redis-pubsub    | 2021-05-19 08:19:16,787 INFO RPC interface 'supervisor' initialized
redis-pubsub    | 2021-05-19 08:19:16,787 INFO RPC interface 'supervisor' initialized
redis-pubsub    | 2021-05-19 08:19:16,787 CRIT Server 'unix_http_server' running without any HTTP authentication checking
redis-pubsub    | 2021-05-19 08:19:16,787 CRIT Server 'unix_http_server' running without any HTTP authentication checking
redis-pubsub    | 2021-05-19 08:19:16,787 INFO supervisord started with pid 1
redis-pubsub    | 2021-05-19 08:19:16,787 INFO supervisord started with pid 1
redis-pubsub    | 2021-05-19 08:19:17,791 INFO spawned: 'php8-fpm' with pid 7
redis-pubsub    | 2021-05-19 08:19:17,791 INFO spawned: 'php8-fpm' with pid 7
redis-pubsub    | 2021-05-19 08:19:17,795 INFO spawned: 'subscriber' with pid 8
redis-pubsub    | 2021-05-19 08:19:17,795 INFO spawned: 'subscriber' with pid 8
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name1"} []
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name2"} []
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: php8-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: php8-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: subscriber entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: subscriber entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis_1         | 1:C 19 May 2021 08:19:16.171 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis_1         | 1:C 19 May 2021 08:19:16.171 # Redis version=6.2.3, bits=64, commit=00000000, modified=0, pid=1, just started
redis_1         | 1:C 19 May 2021 08:19:16.171 # Configuration loaded
redis_1         | 1:M 19 May 2021 08:19:16.172 * monotonic clock: POSIX clock_gettime
redis_1         | 1:M 19 May 2021 08:19:16.172 * Running mode=standalone, port=6380.
redis_1         | 1:M 19 May 2021 08:19:16.172 # Server initialized
redis_1         | 1:M 19 May 2021 08:19:16.172 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis_1         | 1:M 19 May 2021 08:19:16.172 * Ready to accept connections

 🔎  Service log were displayed!
```

> As you can see in the log, the **redis-pubsub** service has been automatically started, and successfully subscribed to the pre-defined channels: **channel:name1** and **channel:name2**.

```bash
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name1"} []
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name2"} []
```

#### Publish a message

```bash
$ make publish-demo-message id=1112233

┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ DEMO: PUBLISH A <demo:event> MESSAGE                                                                                │
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

2021-05-19 08:21:33,538 INFO [ redis-pubsub ]: Successfully published to channel {"channel":"channel:name1","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []
2021-05-19 08:21:33,538 INFO [ redis-pubsub ]: Successfully published to channel {"channel":"channel:name2","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []

 ✅  Task done!
```

#### Check logs

```bash
$ make logs

┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│ DISPLAYING LOG OUTPUT FROM SERVICES                                                                                 │
└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

Attaching to redis-pubsub, microservice-redis-pubsub_redis_1
redis_1         | 1:C 19 May 2021 08:19:16.171 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis_1         | 1:C 19 May 2021 08:19:16.171 # Redis version=6.2.3, bits=64, commit=00000000, modified=0, pid=1, just started
redis_1         | 1:C 19 May 2021 08:19:16.171 # Configuration loaded
redis_1         | 1:M 19 May 2021 08:19:16.172 * monotonic clock: POSIX clock_gettime
redis_1         | 1:M 19 May 2021 08:19:16.172 * Running mode=standalone, port=6380.
redis_1         | 1:M 19 May 2021 08:19:16.172 # Server initialized
redis_1         | 1:M 19 May 2021 08:19:16.172 # WARNING overcommit_memory is set to 0! Background save may fail under low memory condition. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
redis_1         | 1:M 19 May 2021 08:19:16.172 * Ready to accept connections
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/php-fpm.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/php-fpm.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/subscriber.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/subscriber.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Included extra file "/etc/supervisor/conf.d/supervisord.conf" during parsing
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Set uid to user 0 succeeded
redis-pubsub    | 2021-05-19 08:19:16,784 INFO Set uid to user 0 succeeded
redis-pubsub    | 2021-05-19 08:19:16,787 INFO RPC interface 'supervisor' initialized
redis-pubsub    | 2021-05-19 08:19:16,787 INFO RPC interface 'supervisor' initialized
redis-pubsub    | 2021-05-19 08:19:16,787 CRIT Server 'unix_http_server' running without any HTTP authentication checking
redis-pubsub    | 2021-05-19 08:19:16,787 CRIT Server 'unix_http_server' running without any HTTP authentication checking
redis-pubsub    | 2021-05-19 08:19:16,787 INFO supervisord started with pid 1
redis-pubsub    | 2021-05-19 08:19:16,787 INFO supervisord started with pid 1
redis-pubsub    | 2021-05-19 08:19:17,791 INFO spawned: 'php8-fpm' with pid 7
redis-pubsub    | 2021-05-19 08:19:17,791 INFO spawned: 'php8-fpm' with pid 7
redis-pubsub    | 2021-05-19 08:19:17,795 INFO spawned: 'subscriber' with pid 8
redis-pubsub    | 2021-05-19 08:19:17,795 INFO spawned: 'subscriber' with pid 8
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name1"} []
redis-pubsub    | 2021-05-19 08:19:17,844 INFO [ redis-pubsub ]: Successfully subscribed to channel {"channel":"channel:name2"} []
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: php8-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: php8-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: subscriber entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:19:18,845 INFO success: subscriber entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: DemoEventHandler has been fired! {"id":"1112233"} []
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: Message successfully received from channel {"channel":"pubsub_database_channel:name1","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: DemoEventHandler has been fired! {"id":"1112233"} []
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: Message successfully received from channel {"channel":"pubsub_database_channel:name2","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []

 🔎  Service log were displayed!
```

> As you can see in the log, the recently published messages were successfully received by the subscriber:

```bash
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: Message successfully received from channel {"channel":"pubsub_database_channel:name1","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: Message successfully received from channel {"channel":"pubsub_database_channel:name2","payload":"O:29:\"PhpRedisPubSub\\Models\\Message\":4:{s:41:\"\u0000PhpRedisPubSub\\Models\\Message\u0000properties\";a:1:{s:2:\"id\";s:7:\"1112233\";}s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000name\";s:10:\"demo:event\";s:35:\"\u0000PhpRedisPubSub\\Models\\Message\u0000uuid\";s:36:\"8fc58f4c-ba0f-4190-bf5c-b17b6283d64a\";s:40:\"\u0000PhpRedisPubSub\\Models\\Message\u0000timestamp\";i:1621412493;}"} []
```

> Additionally you can see that the business logic related with those events has been executed:

```bash
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: DemoEventHandler has been fired! {"id":"1112233"} []
redis-pubsub    | 2021-05-19 08:21:33,539 INFO [ redis-pubsub ]: DemoEventHandler has been fired! {"id":"1112233"} []
```

## Authors

* **Alcides Ramos** - *Initial work* - [GitHub](https://github.com/alcidesrc)

## License

This project is licensed under the MIT License - see the [LICENSE](https://raw.githubusercontent.com/AlcidesRC/php-redis-pubsub/main/LICENSE) file for details
