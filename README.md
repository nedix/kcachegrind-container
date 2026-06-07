# [kcachegrind-container][project]

Web GUI to inspect Valgrind and Xdebug profiling reports.

![kcachegrind-hero](https://raw.githubusercontent.com/nedix/kcachegrind-container/refs/heads/main/docs/media/screenshot.png)


## Usage with C/C++

Gain performance insights of C and C++ applications using Valgrind with Callgrind as the profiling tool.


### 1. Capture a Callgrind profiling report with Valgrind

```shell
valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes <your program>
```


### 2. Start the KCachegrind container

```shell
docker run \
    --name kcachegrind \
    --pull always \
    --restart unless-stopped \
    -p 127.0.0.1:80:80 \
    -v "${PWD}:/data" \
    nedix/kcachegrind
```


### 3. Open the profiling data with KCachegrind
- Navigate your web browser to the KCachegrind web page on http://127.0.0.1:80
- Click on the Open button in the toolbar
- Navigate to the `/data` directory in the sidebar
- Open your profiling report


## Usage with PHP

Gain performance insights of PHP applications using Xdebug as the profiling tool.


### 1. Download the Compose manifest to your project directory

```shell
wget https://raw.githubusercontent.com/nedix/kcachegrind-container/main/stacks/php/compose-kcachegrind.yml
```


### 2. Start the services

```shell
docker compose -f compose-kcachegrind.yml up -d
```


### 3. Capture a profiling report with Xdebug

- Navigate your web browser to any page on http://127.0.0.1:8081 to capture a profiling report


### 4. Open the profiling data with KCachegrind

- Navigate your web browser to the KCachegrind web page on http://127.0.0.1:8082
- Click on the Open button in the toolbar
- Navigate to the `/data` directory in the sidebar
- Open your profiling report


[project]: https://hub.docker.com/r/nedix/kcachegrind
