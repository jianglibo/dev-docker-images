FROM jianglibo/c8-rust

# docker build -t centos7/rust-vcpkg centos7/vcpkg/
# docker run -ti --rm centos7/rust-vcpkg /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

ENV PATH=/vcpkg:$PATH

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs curl unzip tar telnet gcc gcc-c++ make cmake;

RUN set -eux; \
    cd /; \
    git clone https://github.com/Microsoft/vcpkg.git; \
    cd /vcpkg; \
    sed -i 's/get_path(paths, GitProvider())/{\"git\", \"0\"}/g' toolsrc/src/vcpkg/tools.cpp; \
    ./bootstrap-vcpkg.sh; \
    ./vcpkg integrate install; \
    yum install -y openssl-devel; \
    ./vcpkg install libssh2 sqlite3 openssl;

ENV VCPKG_ROOT=/vcpkg

RUN set -eux; \
    echo "export VCPKG_ROOT=/vcpkg" >> /etc/profile; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "export VCPKG_ROOT=/vcpkg" >> ${HOME}/.bashrc; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc;

VOLUME /vcpkg
