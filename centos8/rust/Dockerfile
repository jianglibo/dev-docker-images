FROM centos:8

# copy from https://github.com/rust-lang/docker-rust/blob/master/1.40.0/stretch/Dockerfile

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=1.41.0 \
    RUSTUP_VERSION=1.21.1

RUN yum install -y wget git

RUN set -eux; \
    rustArch='x86_64-unknown-linux-gnu'; \
    rustupSha256='ad1f8b5199b3b9e231472ed7aa08d2e5d1d539198a15c5b1e53c746aad81d27b'; \
    url="https://static.rust-lang.org/rustup/archive/${RUSTUP_VERSION}/${rustArch}/rustup-init"; \
    wget "$url"; \
    echo "${rustupSha256} *rustup-init" | sha256sum -c -; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
    rustup --version; \
    cargo --version; \
    rustc --version;
RUN set -eux; \
    rustup component add rls rust-analysis rust-src;
RUN set -eux; \
    mkdir /ws; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "export CARGO_HOME=$CARGO_HOME" >> /etc/profile; \
    echo "export RUSTUP_HOME=$RUSTUP_HOME" >> /etc/profile; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc; \
    echo "export CARGO_HOME=$CARGO_HOME" >> ${HOME}/.bashrc; \
    echo "export RUSTUP_HOME=$RUSTUP_HOME" >> ${HOME}/.bashrc;

