# Transmission-cli
docker container for transmission-cli based on alpine.
## Usage
```sh
docker build -t transmission-cli .
docker run --rm -v <download-path>:/download transmission-cli [options] <file|url|magnet>
```
## Help
```sh
docker run --rm transmission-cli < |-h|--help>
```
