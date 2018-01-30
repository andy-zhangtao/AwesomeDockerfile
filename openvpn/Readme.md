# Openvpn Image

This image base on debian:latest. And pre-install vim / openvpn / ssh. 

## How to use?
```
docker run -d -p xxx --cap-add=NET_ADMIN --device=/dev/net/tun  -v <vpn.conf>:/vpn.conf vikings/openvpn /vpn.conf
```