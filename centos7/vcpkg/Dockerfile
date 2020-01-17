FROM rust-centos7

# docker build -t rust-vcpkg-centos7 centos7\vcpkg\
# docker run -ti --rm rust-vcpkg-centos7 /bin/bash

RUN set -eux; \
    yum install -y curl unzip tar; \
    yum install -y centos-release-scl devtoolset-7; \
    yum install -y centos-release-scl devtoolset-7;

RUN set -eux; \
    scl enable devtoolset-7 bash; \
    cd /; \
    git clone https://github.com/Microsoft/vcpkg.git;

RUN set -eux; \
    cd /vcpkg; \
    ./bootstrap-vcpkg.sh; \
    ./vcpkg integrate install;
RUN set -eux; \
    ./vcpkg install libssh2 sqlite3 openssl;
