#!/bin/sh

tinyproxy
openconnect -b $1 
ssh-keygen -A
rc-status
touch /run/openrc/softlevel

/etc/init.d/sshd start

passwd -u root  # unlock root login for ssh port forwarding
ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
chmod og-wx ~/.ssh/authorized_keys

ssh -4 -g -f -N -L 3389:$RDP_HOST:3389 root@127.0.0.1 -o StrictHostKeyChecking=no

tail -f /dev/null
