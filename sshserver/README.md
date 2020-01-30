## Usage
set up the docker container
```
docker built -t sshserver:lastest .
docker run -dit -u root -p 30022:22 sshserver:lastest
```
ssh to container
```
ssh -X -p 30022 root@127.0.0.1
```
if you want to pop up the firefox, export the DISPLAY environment virable
```
export -p
export DISPLAY=192.168.2.34:0  # set the value manumlly
firefox
```

## Help
for mac user, the DISPLAY is
```
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')  # or en1
DISPLAY=$(xhost + $(hostname) > /dev/null; echo $IP):0
```
linux user,
```
DISPLAY=unix$DISPLAY
```

if sometimes you get this error:
```
No protocol specified
Unable to init server: Broadway display type not supported: 192.168.2.34:0
Error: cannot open display: 192.168.2.34:0
```

you just execute `xhost +` on your mac, them run GUI program on your remote ssh server.
