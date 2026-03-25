#!/bin/sh

PIDFILE="/var/run/gate.pid"
BINARY="/usr/local/bin/gate"
CONFIG="/usr/local/etc/gate/config.yml"

is_running()
{
    if [ -f "${PIDFILE}" ]; then
        pid="$(cat "${PIDFILE}" 2>/dev/null)"
        if [ -n "${pid}" ] && kill -0 "${pid}" 2>/dev/null; then
            return 0
        fi
    fi
    return 1
}

start_gate()
{
    if is_running; then
        return 0
    fi
    /usr/sbin/daemon -f -P "${PIDFILE}" "${BINARY}" -c "${CONFIG}"
}

stop_gate()
{
    if is_running; then
        kill "$(cat "${PIDFILE}")" 2>/dev/null || true
        sleep 1
    fi
    rm -f "${PIDFILE}"
}

case "$1" in
    start)
        start_gate
        ;;
    stop)
        stop_gate
        ;;
    restart|reload)
        stop_gate
        start_gate
        ;;
    status)
        if is_running; then
            echo "gate is running"
        else
            echo "gate is not running"
        fi
        ;;
    *)
        echo "usage: $0 {start|stop|restart|reload|status}" >&2
        exit 1
        ;;
esac
