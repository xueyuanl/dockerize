### Uasge

```
docker build -t opencisco:0.1 .

# default is China-Unicom
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1

# with remote desktop
docker run --rm -it --privileged --env RDP_HOST=<hostname or ip> -p 8888:8888 -p 3389:3389 opencisco:0.1

```
or use a specific vpn server
```
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-usa-east.emc.com # USA-East 
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-usa-west.emc.com # USA-West 
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-ie.emc.com # Ireland
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-ind.emc.com # India
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-aus.emc.com # Australia
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-sin.emc.com # Singapore
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-isr.emc.com # Israel
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-usa-south.emc.com # USA-South
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1 vpn-egy.emc.com # Egypt
```

for ssh over http proxy
```
ssh user@<taregt-ip> -o "ProxyCommand=nc -X connect -x <proxy-ip>:<proxy-port> %h %p"
```
meet "Write Failed: broken pipe"
You could set either `ServerAliveInterval` in `/etc/ssh/ssh_config` of the client machine or `ClientAliveInterval` in `/etc/ssh/sshd_config` of the server machine. Try reducing the interval if you are still getting the error.
```
# on client
Host *
ServerAliveInterval 120
# on server
ClientAliveInterval 120
```
Configuration for a single user can be set in file `~/.ssh/config` both on the server and client side. Make sure the file has correct permissions chmod 644 `~/.ssh/config`.
