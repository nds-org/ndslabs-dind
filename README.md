# NDS Labs Docker-in-Docker

NDS Labs image for Docker-in-Docker support based on [dind](https://github.com/docker-library/docker/blob/746d9052066ccfbcb98df7d9ae71cf05d8877419/1.12/dind/Dockerfile). This image adds a few utilities on top of the base dind and changes the Docker storage driver from vfs to overlay for performance reasons.

## Prerequisites
* Docker (obviously)

## Build
To build up this image:
```bash
docker build -t ndslabs/dind .
```

## Run
To run an isolated Docker instance:
```bash
docker run -it --privileged ndslabs/dind
```

## Test Cases
Pull an image:
```bash
docker pull 
```

Run a container from an image:
```bash
docker run -it --rm 
```

Build the image from within a container running that image:
```bash
git clone https://github.com/nds-org/ndslabs-dind
cd ndslabs-dind/
docker build -t ndslabs/dind .
```

In a word: ["Woah..."](https://cdn.meme.am/cache/instances/folder56/66577056.jpg)
