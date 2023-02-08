# kcachegrind-docker

## Setup

*docker-compose-kcachegrind.yml*

```yaml
version: "3.8"

services:
  nginx-xdebug:
    image: wodby/nginx:1.19
    environment:
      NGINX_VHOST_PRESET: php
      NGINX_BACKEND_HOST: xdebug
      NGINX_SERVER_ROOT: '${NGINX_SERVER_ROOT:-/var/www/html/public_html}'
    ports:
      - 8000:80
    volumes:
      - app:/var/www/html

  xdebug:
    image: wodby/php:8.1-dev
    environment:
      - PHP_DEBUG=true
      - PHP_XDEBUG=true
      - PHP_XDEBUG_MODE=profile
    volumes:
      - app:/var/www/html
      - xdebug:/mnt/files/xdebug
    depends_on:
      - nginx-xdebug

  kcachegrind:
    image: kcachegrind
    ports:
      - 8001:8080
    volumes:
      - app:/var/www/html
      - xdebug:/data/xdebug
    depends_on:
      - xdebug

volumes:
  app:
    driver: local
  xdebug:
    driver: local
```

## Usage

### Step 1.

Start the containers:

```shell
docker compose -f docker-compose.yml -f docker-compose-kcachegrind.yml up -d
```

### Step 2.

Navigate to your page on [http://localhost:8000](localhost:8000) to capture the profiling data.

### Step 3.

Find KCachegrind on [http://localhost:8001](localhost:8001).
