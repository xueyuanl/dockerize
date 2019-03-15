FROM ubuntu:16.04
MAINTAINER pat

RUN apt-get update 1> /dev/null && \
    apt-get install -y transmission-cli 1> /dev/null && \
    apt-get autoremove && \
    apt-get clean

VOLUME ["/download"]

ENTRYPOINT ["/usr/bin/transmission-cli"]
CMD ["--help"]
