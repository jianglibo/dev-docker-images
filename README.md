# dev-docker-images

centos7/rust
centos7/rust-vcpkg
centos7/rust-dev-ssh
centos7/bk-over-ssh-run
centos7/bk-over-ssh-dev
centos7/bk-over-ssh-cached

https://docs.docker.com/storage/volumes/

<!-- docker volume create t_volume -->

if t_volume doesn't exist, the following command will create one for you. and copy the contents of /ws to the volume.
```
docker volume rm t_volume
docker run --rm -ti --mount type=volume,source=t_volume,target=/ws tv /bin/bash
```
In the container created, change the content of /ws/aa.txt, and create a new file bb.txt. run the command again you will find the docker copy the contents of volume to target path.

```
docker run --rm -ti --mount type=volume,source=t_volume,target=/ws tv /bin/bash
```
