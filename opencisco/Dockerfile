FROM alpine:edge

RUN apk add --no-cache openconnect --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN set -xe && \
	apk add --no-cache sudo bash openrc tinyproxy openssh && \
	rc-update add sshd && \
	sed -i -e '/^Allow /s/^/#/' /etc/tinyproxy/tinyproxy.conf && \
	mkdir ~/.ssh && chmod 700 ~/.ssh && \
	touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && \
	sed -i '/^AllowTcpForwarding/s/no/yes/' /etc/ssh/sshd_config

COPY ./entrypoint.sh ./

RUN chmod +x /entrypoint.sh

EXPOSE 8888
EXPOSE 3389

ENTRYPOINT ["./entrypoint.sh"]

CMD ["vpn-chn.emc.com"]
