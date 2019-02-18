FROM alpine:latest
MAINTAINER pat

RUN apk add transmission-cli 1> /dev/null

VOLUME ["/download"]

ENTRYPOINT ["/usr/bin/transmission-cli"]
CMD ["--help"]
