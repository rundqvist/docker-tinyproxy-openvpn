# Docker OpenVPN container with Tinyproxy
A user friendly container for proxying http(s)-traffic through vpn.

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/openvpn-tinyproxy.svg)](https://hub.docker.com/r/rundqvist/openvpn-tinyproxy)
[![image size](https://img.shields.io/docker/image-size/rundqvist/openvpn-tinyproxy.svg)](https://hub.docker.com/r/rundqvist/openvpn-tinyproxy)
[![commit activity](https://img.shields.io/github/commit-activity/m/rundqvist/docker-openvpn-tinyproxy)](https://github.com/rundqvist/docker-openvpn-tinyproxy)
[![last commit](https://img.shields.io/github/last-commit/rundqvist/docker-openvpn-tinyproxy.svg)](https://github.com/rundqvist/docker-openvpn-tinyproxy)

## Do you find this container useful? 
Please support the development by making a small donation.

[![Support](https://img.shields.io/badge/support-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![Support](https://img.shields.io/badge/support-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![Support](https://img.shields.io/badge/support-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)

## Features
* Killswitch (kills network if vpn is down)
* Proxies all http(s)-traffic through vpn
* Connect to random server
* Reconnects if connection breaks
* Healthcheck (checking that ip differs from public ip)

## Requirements
* A supported VPN account (currently [ipvanish](https://www.ipvanish.com/?a_bid=48f95966&a_aid=5f3eb2f0be07f) or [wevpn](https://www.wevpn.com/aff/rundqvist))

[![Sign up](https://img.shields.io/badge/sign_up-IPVanish_VPN-6fbc44)](https://www.ipvanish.com/?a_bid=48f95966&a_aid=5f3eb2f0be07f)
[![Sign up](https://img.shields.io/badge/sign_up-WeVPN-e33866)](https://www.wevpn.com/aff/rundqvist)

## Components
Built on [rundqvist/openvpn](https://hub.docker.com/r/rundqvist/openvpn) container.
* [Alpine Linux](https://www.alpinelinux.org)
* [Supervisor](https://github.com/Supervisor/supervisor)
* [OpenVPN](https://github.com/OpenVPN/openvpn)
* [Tinyproxy](https://tinyproxy.github.io)

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
    -e 'HOST_IP=[your server ip]' \
    -e 'VPN_PROVIDER=[your vpn provider]' \
    -e 'VPN_USERNAME=[your vpn username]' \
    -e 'VPN_PASSWORD=[your vpn password]' \
    -e 'VPN_COUNTRY=[your desired country]' \
    -v /path/to/cache/folder:/cache/ \
    rundqvist/openvpn-tinyproxy
```

### Configuration
See base image ([rundqvist/openvpn](https://hub.docker.com/r/rundqvist/openvpn)) for detailed vpn configuration.

#### Variables

| Variable | Usage |
|----------|-------|
| _PORT_ | Port for access to tinyproxy |
| HOST_IP | IP of server on your local network (needed for communication between container and local network).  |
| _VPN_PROVIDER_ | Your VPN provider ("[ipvanish](https://www.ipvanish.com/?a_bid=48f95966&a_aid=5f3eb2f0be07f)" or "[wevpn](https://www.wevpn.com/aff/rundqvist)"). |
| _VPN_USERNAME_ | Your VPN username. |
| _VPN_PASSWORD_ | Your VPN password. |
| _VPN_COUNTRY_ | ISO 3166-1 alpha-2 country code (https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). |
| VPN_KILLSWITCH | Kills network if vpn is down. <br />`true` (default) or `false`. |
| VPN_INCLUDED_REMOTES | Host names separated by one space. VPN will _only_ connect to entered remotes. |
| VPN_EXCLUDED_REMOTES | Host names separated by one space. VPN will _not_ connect to entered remotes. |
| VPN_RANDOM_REMOTE | Connects to random remote. <br />`true` or `false` (default). |

Variables in _cursive_ is mandatory.

#### Volumes

| Folder | Usage |
|--------|-------|
| /cache/ | Used for caching original configuration files from vpn provider |

## Setup
Configure your client to use [your docker host ip]:[PORT] as proxy.

## Issues
Please report issues at https://github.com/rundqvist/docker-openvpn-tinyproxy/issues
