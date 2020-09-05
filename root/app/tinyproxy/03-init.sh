#!/bin/sh

if expr "${NETWORK}" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.0$' >/dev/null; then
    log -i tinyproxy "Adding route for communication with network $NETWORK/24";
    route add -net ${NETWORK} netmask 255.255.255.0 gw $(ip route | awk '/default/ { print $3 }')
else
    log -w tinyproxy "NETWORK missing or wrong format. May cause communication problems.";
fi