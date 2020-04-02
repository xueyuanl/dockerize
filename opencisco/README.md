### Uasge

```
docker build -t opencisco:0.1 .

# default is China-Unicom
docker run --rm -it --privileged -p 8888:8888 opencisco:0.1
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
