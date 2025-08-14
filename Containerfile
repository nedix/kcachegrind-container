ARG DEBIAN_VERSION=bookworm
ARG EASY_NOVNC_VERSION=v1.1.0
ARG GO_VERSION=1.25
ARG S6_OVERLAY_VERSION=3.2.1.0

FROM debian:${DEBIAN_VERSION}-slim AS base

ARG S6_OVERLAY_VERSION

ARG BUILD_DEPS=" \
    wget \
    xz-utils \
"

RUN apt update -y \
    && apt install -y $BUILD_DEPS \
    && case "$(uname -m)" in \
        aarch64) \
            S6_OVERLAY_ARCHITECTURE="aarch64" \
        ;; arm*) \
            S6_OVERLAY_ARCHITECTURE="arm" \
        ;; x86_64) \
            S6_OVERLAY_ARCHITECTURE="x86_64" \
        ;; *) echo "Unsupported architecture: $(uname -m)"; exit 1; ;; \
    esac \
    && wget -qO- "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz" \
    | tar -xpJf- -C / \
    && wget -qO- "https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCHITECTURE}.tar.xz" \
    | tar -xpJf- -C / \
    && apt remove -y $BUILD_DEPS

FROM golang:${GO_VERSION}-${DEBIAN_VERSION} AS easy-novnc

ARG EASY_NOVNC_VERSION

WORKDIR /build/easy-novnc/

RUN go mod init build \
    && go get github.com/geek1011/easy-novnc@${EASY_NOVNC_VERSION} \
    && go build -o /build/easy-novnc/bin/ github.com/geek1011/easy-novnc

FROM base

RUN apt update -y \
    && apt install -y \
        breeze \
        dbus-x11 \
        graphviz \
        kcachegrind \
        openbox \
        tigervnc-standalone-server \
        xdg-utils

COPY --from=easy-novnc /build/easy-novnc/bin/ /usr/local/bin/

COPY /rootfs/ /

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 80

VOLUME /data
