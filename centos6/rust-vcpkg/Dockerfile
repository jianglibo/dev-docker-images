FROM jianglibo/c6-rust

# docker build -t centos7/rust-vcpkg centos7/vcpkg/
# docker run -ti --rm centos7/rust-vcpkg /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

ENV PATH=/vcpkg:$PATH

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs curl unzip tar telnet;

RUN set -eux; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7; \
    yum install -y --setopt=tsflags=nodocs centos-release-scl devtoolset-7; \
    source scl_source enable devtoolset-7; \
    yum -y install rh-git29;

RUN set -eux; \
    cd /; \
    git clone https://github.com/Microsoft/vcpkg.git; \
    git checkout tags/2019.12 -b 2019.12;

RUN source scl_source enable devtoolset-7; \
    set -eux; \
    cd /vcpkg; \
    ./bootstrap-vcpkg.sh; \
    ./vcpkg integrate install;


RUN source scl_source enable devtoolset-7 rh-git29; \
    set -eux; \
    cd /vcpkg; \
    yum install -y openssl-devel; \
    ./vcpkg install libssh2 sqlite3 openssl;

ENV VCPKG_ROOT=/vcpkg

RUN set -eux; \
    echo "source scl_source enable devtoolset-7 rh-git29"  >> /etc/profile; \
    echo "export VCPKG_ROOT=/vcpkg" >> /etc/profile; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "source scl_source enable devtoolset-7 rh-git29"  >> /root/.bashrc; \
    echo "export VCPKG_ROOT=/vcpkg" >> /root/.bashrc; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc;

VOLUME /vcpkg
