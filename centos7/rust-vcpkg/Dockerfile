FROM jianglibo/c7-rust

# docker build -t centos7/rust-vcpkg centos7/vcpkg/
# docker run -ti --rm centos7/rust-vcpkg /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

ENV PATH=/vcpkg:$PATH

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs curl unzip tar telnet;

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7;

RUN set -eux; \
    cd /; \
    git clone https://github.com/Microsoft/vcpkg.git;

RUN source scl_source enable devtoolset-7; \
    set -eux; \
    cd /vcpkg; \
    ./bootstrap-vcpkg.sh; \
    ./vcpkg integrate install;

RUN source scl_source enable devtoolset-7; \
    set -eux; \
    yum -y install rh-git218;

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /vcpkg; \
    yum install -y openssl-devel; \
    ./vcpkg install libssh2 sqlite3 openssl;

ENV VCPKG_ROOT=/vcpkg

RUN set -eux; \
    echo "export VCPKG_ROOT=/vcpkg" >> /etc/profile; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "source scl_source enable devtoolset-7 rh-git218"  >> /etc/profile; \
    echo "export VCPKG_ROOT=/vcpkg" >> ${HOME}/.bashrc; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc; \
    echo "source scl_source enable devtoolset-7 rh-git218"  >> ${HOME}/.bashrc;

VOLUME /vcpkg
