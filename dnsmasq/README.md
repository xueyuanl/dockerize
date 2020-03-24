### Usage

```
docker build -t dnsmasq .
docker run --rm -d -p 53:53/tcp -p 53:53/udp --cap-add=NET_ADMIN dnsmasq

```
