FROM centos7/rust-dev-ssh

# docker build -t centos7/bk-over-ssh-cached centos7/bk-over-ssh-cached/
# docker run -ti --rm centos7/bk-over-ssh-cached /bin/bash

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