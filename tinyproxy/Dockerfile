FROM alpine:3.9

MAINTAINER pat

RUN set -xe && \
	apk add --no-cache tinyproxy  && \
	sed -i -e '/^Allow /s/^/#/'  \
	/etc/tinyproxy/tinyproxy/tinyproxy.conf

VOLUME /etc/tinyproxy
EXPOSE 8888

ENTRYPOINT ["tinyproxy"]
CMD ["-d"]
