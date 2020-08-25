#!/bin/sh

if expr "${NETWORK}" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
    log -i "Adding route for communication with network $NETWORK/24";
    route add -net ${NETWORK} netmask 255.255.255.0 gw $(ip route | awk '/default/ { print $3 }')
elif [ "$NETWORK" = "ignore" ] ; then
    log -w "Ignoring network routes. Probably won't be able to use tinyproxy."
else
    log -e "-e NETWORK missing or wrong format. Please see the docs @ https://hub.docker.com/r/rundqvist/openvpn-tinyproxy/";
    exit 1;
fi
