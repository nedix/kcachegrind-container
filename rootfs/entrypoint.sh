#!/usr/bin/env sh

exec env -i \
    S6_STAGE2_HOOK="/usr/sbin/s6-stage2-hook" \
    /init
