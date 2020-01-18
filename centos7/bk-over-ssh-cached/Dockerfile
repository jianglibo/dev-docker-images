FROM rust-centos7-dev

# docker build -t bk-over-ssh-cached-centos7 centos7\bk-over-ssh-cached\
# docker run -ti --rm bk-over-ssh-cached-centos7 /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws; \
    echo "${VCPKG_ROOT}"; \
    git clone https://github.com/jianglibo/bk-over-ssh.git;

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws/bk-over-ssh; \
    cargo build --release; \
    mv ./target /ws/; \
    echo "$(ls /ws)";
RUN set -eux; \
    rm -rf /ws/bk-over-ssh;