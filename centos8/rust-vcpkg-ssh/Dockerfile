FROM jianglibo/c8-rust-vcpkg

# yum -y install yum-utils
# repoquery --list bash

# docker run -p 222:22 --detach --name rust-dev-ssh centos7/rust-dev-ssh
# docker inspect --format '{{ .NetworkSettings.IPAddress }}' rust-dev-ssh


RUN yum install -y openssh-server openssh-clients
RUN set -eux; \
    mkdir /var/run/sshd; \
    echo 'root:root' | chpasswd; \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    /usr/bin/ssh-keygen -A;

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# allow access to container from windows machine.
# route /P add 172.0.0.0 MASK 255.0.0.0 10.0.75.2

# docker logs rust-centos7-dev
# docker container stop rust-centos7-dev
# docker run -p 22:22 -ti --rm --name test_sshd rust-centos7-dev:v0.1.0 /bin/bash

#docker container stop test_sshd
#docker container rm test_sshd
#docker image rm eg_sshd