ARG DEBIAN_VERSION=bookworm
ARG EASY_NOVNC_VERSION=v1.1.0
ARG GO_VERSION=1.22

FROM golang:${GO_VERSION}-${DEBIAN_VERSION} AS build-easy-novnc

ARG EASY_NOVNC_VERSION

WORKDIR /src

RUN go mod init build \
    && go get github.com/geek1011/easy-novnc@${EASY_NOVNC_VERSION} \
    && go build -o /bin/easy-novnc github.com/geek1011/easy-novnc

FROM debian:${DEBIAN_VERSION}-slim

RUN apt update \
    && apt install -y --no-install-recommends \
        breeze \
        ca-certificates \
        dbus-x11 \
        gosu \
        graphviz \
        kcachegrind \
        openbox \
        supervisor \
        tigervnc-standalone-server \
        xdg-utils \
    && rm -rf /var/lib/apt/lists \
    && mkdir -p /usr/share/desktop-directories

COPY --from=build-easy-novnc /bin/easy-novnc /usr/local/bin/

ADD rootfs /

RUN groupadd --gid 1000 app \
    && useradd --home-dir /data --shell /bin/bash --uid 1000 --gid 1000 app \
    && mkdir -p /data

EXPOSE 8080

VOLUME /data

CMD ["sh", "-c", "chown app:app /data /dev/stdout && exec gosu app supervisord"]
