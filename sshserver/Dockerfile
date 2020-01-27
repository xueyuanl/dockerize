FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
	firefox \
	vim \
	openssh-client \
	openssh-server && \
	echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
    #echo "RSAAuthentication yes" >> /etc/ssh/sshd_config && \
    #echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
	sed -i "s/prohibit-password/yes/g" /etc/ssh/sshd_config && \
    echo "root:docker" | chpasswd


COPY ./entrypoint.sh ./entrypoint.sh

CMD ["/bin/bash","entrypoint.sh"]
