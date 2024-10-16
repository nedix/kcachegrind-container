# [kcachegrind-container](https://github.com/nedix/kcachegrind-container)

Web GUI for Valgrind and Xdebug profiling reports.

<img width="1511" alt="Screenshot at Oct 13 19-36-16" src="https://github.com/user-attachments/assets/dd4cc5f1-5c61-4837-95a0-4365554df631">

## Usage

### C/C++

Gain performance insights of C and C++ applications using Valgrind with Callgrind as the profiling tool.

**1. Capture a Callgrind profiling report with Valgrind**

```shell
valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes <your program>
```

**2. Start the KCachegrind service**

```shell
docker run --rm -d -p 8080:80 -v "${PWD}:/data" --name kcachegrind nedix/kcachegrind
```

**3. Gain insight into performance metrics of your C/C++ application**

- Browse to the KCachegrind web interface on http://127.0.0.1:8080
- Click on the Open button in the toolbar
- Navigate to the `/data` directory using the sidebar
- Open your profiling report

### PHP

View performance metrics of PHP applications using Xdebug as the profiling tool.

**1. Download the Docker Compose manifest to your project directory**

```shell
wget https://raw.githubusercontent.com/nedix/kcachegrind-container/refs/heads/main/docs/examples/php/docker-compose-kcachegrind.yml
```

**2. Start the KCachegrind service**

```shell
docker compose -f docker-compose-kcachegrind.yml up
```

**3. Capture a profiling report with Xdebug**

- Navigate to any page on http://127.0.0.1:8081 to capture a profiling report

**4. Gain insight into performance metrics of your application**

- Browse to the KCachegrind web interface on http://127.0.0.1:8082
- Click on the Open button in the toolbar
- Navigate to the `/data` directory using the sidebar
- Open your profiling report

## Attribution

- [easy-novnc] [(License)](https://raw.githubusercontent.com/pgaskin/easy-novnc/master/LICENSE.md)
- [KCachegrind] [(License)](https://github.com/KDE/kcachegrind/tree/master/LICENSES)

[easy-novnc]: https://github.com/pgaskin/easy-novnc
[KCachegrind]: https://github.com/KDE/kcachegrind
