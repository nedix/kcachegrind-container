#!/usr/bin/env sh

: ${STARTUP_TIMEOUT}

exec env -i \
    S6_CMD_WAIT_FOR_SERVICES_MAXTIME="$(( $STARTUP_TIMEOUT * 1000 ))" \
    S6_STAGE2_HOOK="/usr/sbin/s6-stage2-hook" \
    /init
