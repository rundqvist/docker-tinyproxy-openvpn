# Docker OpenVPN container with Tinyproxy
A small container for proxying http(s)-traffic through vpn.
https://hub.docker.com/r/rundqvist/openvpn-tinyproxy/

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/openvpn-tinyproxy.svg)](https://hub.docker.com/r/rundqvist/openvpn-tinyproxy)

# Appreciate my work?
Do you find this container useful? Please consider a donation.

[![Donate](https://img.shields.io/badge/Donate-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![Donate](https://img.shields.io/badge/Donate-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)

## Features
* Proxies all http(s)-traffic through vpn
* Connect to random server
* Reconnects if connection breaks
* Healthcheck (checking that ip differs from public ip)

## Requirements
* A supported VPN account

[![Affiliate](https://img.shields.io/badge/Affiliate-IPVanish_VPN-6fbc44)](https://www.ipvanish.com/?a_bid=48f95966&a_aid=5f3eb2f0be07f)
[![Affiliate](https://img.shields.io/badge/Affiliate-WeVPN-e33866)](https://www.wevpn.com/aff/rundqvist)

## Components
* Alpine Linux
* OpenVPN container as base (https://hub.docker.com/r/rundqvist/openvpn)
* Tinyproxy (https://tinyproxy.github.io)

## Run
```
$ sudo docker run \
    -d \
    --cap-add=NET_ADMIN \
    --device=/dev/net/tun \
    --name=openvpn-tinyproxy \
    --dns 1.1.1.1 \
    --dns 1.0.0.1 \
    -p [PORT]:8888 \
    -e 'NETWORK=[your private network]' \
    -e 'VPN_PROVIDER=[your vpn provider]' \
    -e 'VPN_USERNAME=[your vpn username]' \
    -e 'VPN_PASSWORD=[your vpn password]' \
    -e 'VPN_COUNTRY=[your desired country]' \
    -v /path/to/cache/folder:/cache/ \
    rundqvist/openvpn-tinyproxy
```

### Configuration

#### Variables

| Variable | Usage |
|----------|-------|
| _PORT_ | Port for access to tinyproxy |
| _NETWORK_ | Your private network IP (example 192.168.0.0). Needed to be able to use tinyproxy. Set to 'ignore' if you intend to omit this. |
| _VPN_PROVIDER_ | Your VPN provider ("ipvanish" or "wevpn"). |
| _VPN_USERNAME_ | Your VPN username. |
| _VPN_PASSWORD_ | Your VPN password. |
| _VPN_COUNTRY_ | ISO 3166-1 alpha-2 country code (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). |
| VPN_INCLUDED_REMOTES | Host names separated by one space. Restricts VPN to entered remotes. |
| VPN_EXCLUDED_REMOTES | Host names separated by one space. VPN will not connect to entered remotes. |
| VPN_RANDOM_REMOTE | Connects to random remote. "true" or "false". |

Variables in _cursive_ is mandatory.

#### Volumes

| Folder | Usage |
|--------|-------|
| /cache/ | Used for caching original configuration files from vpn provider |

## Setup
Configure your client to use [your docker host ip]:[PORT] as proxy.

If you're not going to use tinyproxy, you probably want base image instead: https://hub.docker.com/r/rundqvist/openvpn.

## Issues
Please report issues at https://github.com/rundqvist/docker-openvpn-tinyproxy/issues
