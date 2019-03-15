# Transmission-cli
docker container for transmission-cli based on ubuntu.
## Usage
```sh
docker build -t transmission-cli .
docker run --rm -v <download-path>:/download transmission-cli [options|-w /download] <file|url|magnet>
```
## Help
```sh
docker run --rm transmission-cli < |-h|--help>
```
