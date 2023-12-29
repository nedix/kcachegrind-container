# [kcachegrind]-docker

Web interface for [KCachegrind]. Can be used with Xdebug to give insight into performance metrics of PHP applications.

## Setup

#### Create a Docker Compose manifest

This example Docker Compose manifest expects that you have your main application services defined in `docker-compose.yml`.
It will listen for requests on port `81` and `82`.

*docker-compose-kcachegrind.yml*

```yaml
services:
  nginx-xdebug:
    image: wodby/nginx:1.19
    environment:
      NGINX_VHOST_PRESET: php
      NGINX_BACKEND_HOST: xdebug
      NGINX_SERVER_ROOT: /var/www/html/public
    ports:
      - 81:80
    volumes:
      - app:/var/www/html

  xdebug:
    image: wodby/php:8.1-dev
    environment:
      PHP_DEBUG: true
      PHP_XDEBUG: true
      PHP_XDEBUG_MODE: profile
    volumes:
      - app:/var/www/html
      - xdebug:/mnt/files/xdebug
    depends_on:
      - nginx-xdebug

  kcachegrind:
    image: ghcr.io/nedix/kcachegrind-docker
    ports:
      - 82:8080
    volumes:
      - app:/var/www/html
      - xdebug:/data/xdebug
    depends_on:
      - xdebug

volumes:
  app:
    driver: local
    driver_opts:
      device: ${PWD}
      o: bind
      type: none
  xdebug:
    driver: local
```

## Usage

#### Start the services

```shell
docker compose -f docker-compose.yml -f docker-compose-kcachegrind.yml up -d
```

#### Capture a profiling report

Navigate to any page on http://127.0.0.1:81 to capture the profiling report.

#### Get insight into performance

Navigate to the [KCachegrind] web interface on http://127.0.0.1:82.

<hr>

## Attribution

Powered by [easy-novnc], [KCachegrind], [OpenboxWM] and [TigerVNC].

[easy-novnc]: https://github.com/pgaskin/easy-novnc
[KCachegrind]: https://github.com/KDE/kcachegrind
[OpenboxWM]: https://github.com/danakj/openbox
[TigerVNC]: https://github.com/TigerVNC/tigervnc
