FROM jianglibo/c7-bk-over-ssh-cached

# default shell.
SHELL ["/bin/sh", "-c"]

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws; \
    git clone https://github.com/jianglibo/bk.git; \
    cd /ws/bk; \
    ln -s /ws/target;
WORKDIR /ws/bk
