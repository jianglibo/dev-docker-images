FROM jianglibo/c6-rust

# docker build -t centos7/rust-vcpkg centos7/vcpkg/
# docker run -ti --rm centos7/rust-vcpkg /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

ENV PATH=/vcpkg:$PATH

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs curl unzip tar telnet; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7; \
    yum -y install rh-git29; \
    cd /; \
    git clone https://github.com/Microsoft/vcpkg.git; \
    cd /vcpkg;


RUN source scl_source enable devtoolset-7 rh-git29; \
    set -eux; \
    cd /vcpkg; \
    git checkout tags/2019.12 -b 2019.12; \
    ./bootstrap-vcpkg.sh; \
    ./vcpkg integrate install; \
    yum install -y openssl-devel; \
    ./vcpkg install libssh2 sqlite3 openssl;

ENV VCPKG_ROOT=/vcpkg

# source scl_source enable line must put as last line. it's important!
RUN set -eux; \
    echo "export VCPKG_ROOT=/vcpkg" >> /etc/profile; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "source scl_source enable devtoolset-7 rh-git29"  >> /etc/profile; \
    echo "export VCPKG_ROOT=/vcpkg" >> ${HOME}/.bashrc; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc; \
    echo "source scl_source enable devtoolset-7 rh-git29"  >> ${HOME}/.bashrc;

VOLUME /vcpkg
