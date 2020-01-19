FROM centos7/bk-over-ssh-cached

# docker build -t centos7/bk-over-ssh-dev centos7/bk-over-ssh-dev/
# docker run -ti --rm centos7/bk-over-ssh-dev /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws; \
    git clone https://github.com/jianglibo/bk-over-ssh.git; \
    cd /ws/bk-over-ssh; \
    ln -s /ws/target;
WORKDIR /ws/bk-over-ssh
