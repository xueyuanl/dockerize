# dockerize tinyproxy based on alpine

## usage
docker build -t tinyproxy .
docker run -p 8888:8888 --rm tinyproxy
or
docker run -p 8888:8888 --rm -d tinyproxy
