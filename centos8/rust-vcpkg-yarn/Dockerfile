FROM jianglibo/c7-rust-vcpkg

# default shell.
SHELL ["/bin/sh", "-c"]

RUN set -eux; \
    curl -sL https://rpm.nodesource.com/setup_10.x | bash -; \
    yum install -y nodejs;

RUN set -eux; \
    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo; \
    yum install -y yarn; \
    curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh;
