# [kcachegrind]-docker

Web interface for KCachegrind.

## Examples

### Callgrind

View performance metrics of C and C++ applications using valgrind with callgrind as the profiling tool.

**1. Capture a callgrind report using valgrind**

```shell
valgrind --tool=callgrind <your program>
```

**2. Start the kcachegrind service**

```shell
docker run --rm -p 8080:8080 -v "${PWD}:/data" --name kcachegrind ghcr.io/nedix/kcachegrind-docker:v0.26.0
```

**3. Gain insight into performance metrics of your application**

- Browse to the KCachegrind web interface on http://127.0.0.1:8080
- Open a profiling report from the `/data` directory

### PHP

View performance metrics of PHP applications using xdebug as the profiling tool.

**1. Download the Docker Compose manifest to your project directory**

```shell
wget https://raw.githubusercontent.com/nedix/kubernetes-exporter-docker/main/docs/examples/php/docker-compose-kcachegrind.yml
```

**2. Start the kcachegrind service**

```shell
docker compose -f docker-compose-kcachegrind.yml up
```

**3. Capture a profiling report using xdebug**

- Navigate to any page on http://127.0.0.1:8081 to capture a profiling report

**4. Gain insight into performance metrics of your application**

- Browse to the KCachegrind web interface on http://127.0.0.1:8082
- Open a profiling report from the `/data` directory

## Attribution

- [easy-novnc] [(License)](https://raw.githubusercontent.com/pgaskin/easy-novnc/master/LICENSE.md)
- [KCachegrind] [(License)](https://github.com/KDE/kcachegrind/tree/master/LICENSES)

[easy-novnc]: https://github.com/pgaskin/easy-novnc
[KCachegrind]: https://github.com/KDE/kcachegrind
