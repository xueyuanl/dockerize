FROM alpine:edge

RUN apk add --no-cache openconnect --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN set -xe && \
	apk add --no-cache tinyproxy  && \
	sed -i -e '/^Allow /s/^/#/'  \
	/etc/tinyproxy/tinyproxy.conf

COPY ./entrypoint.sh ./

RUN chmod +x /entrypoint.sh

EXPOSE 8888

ENTRYPOINT ["./entrypoint.sh"]

CMD ["vpn-chn.emc.com"]
