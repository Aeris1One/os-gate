PLUGIN_NAME=        gate
PLUGIN_VERSION=     1.0
PLUGIN_REVISION=    0
PLUGIN_COMMENT=     Gate Minecraft Reverse Proxy (Lite mode)
PLUGIN_MAINTAINER=  votre-email@example.com
PLUGIN_CATEGORIES=  net
PLUGIN_WWW=         https://gate.minekube.com/

GATE_VERSION?=      0.62.4
GATE_ARCH?=         amd64

# The Gate binary is installed via contrib/Makefile.

.include "../../Mk/plugins.mk"
