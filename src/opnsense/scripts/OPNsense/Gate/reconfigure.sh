#!/bin/sh

# Regenerate Gate configuration from OPNsense model
configctl template reload OPNsense/Gate

# Disabled because I figured out Gate has live config reload functionality
# Restart Gate if enabled
#ENABLED=$(/usr/local/sbin/pluginctl -g OPNsense.Gate.general.enabled 2>/dev/null)
#
#if [ "$ENABLED" = "1" ]; then
#    /bin/pkill -qf "/usr/local/bin/gate" 2>/dev/null
#    sleep 1
#    /usr/local/bin/gate -c /usr/local/etc/gate/config.yml &
#else
#    /bin/pkill -qf "/usr/local/bin/gate" 2>/dev/null
#fi
