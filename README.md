# [kcachegrind]-docker

Web interface for KCachegrind.

Can be used with Xdebug to gain insights into performance metrics of PHP applications.

## Setup

**Download the Docker Compose manifest**

```shell
wget https://raw.githubusercontent.com/nedix/kubernetes-exporter-docker/main/docs/examples/docker-compose-kcachegrind.yml
```

## Usage

**Start the services**

```shell
docker compose -f docker-compose-kcachegrind.yml up
```

**Capture a profiling report**

- Navigate to any page on http://127.0.0.1:81 to capture a profiling report

**View performance data of your application**

- Browse to the KCachegrind web interface on http://127.0.0.1:82
- Open a profiling report from the `/data` directory

## Attribution

- [easy-novnc] [(License)](https://raw.githubusercontent.com/pgaskin/easy-novnc/master/LICENSE.md)
- [KCachegrind] [(License)](https://github.com/KDE/kcachegrind/tree/master/LICENSES)

[easy-novnc]: https://github.com/pgaskin/easy-novnc
[KCachegrind]: https://github.com/KDE/kcachegrind
