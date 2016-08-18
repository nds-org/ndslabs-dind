# NDS Labs Docker-in-Docker

NDS Labs image for Docker-in-Docker support based on [dind](https://github.com/docker-library/docker/blob/746d9052066ccfbcb98df7d9ae71cf05d8877419/1.12/dind/Dockerfile). This image adds a few utilities on top of the base dind and changes the Docker storage driver from vfs to overlay for performance reasons.
