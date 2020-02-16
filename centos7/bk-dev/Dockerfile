FROM jianglibo/c7-rust-vcpkg-yarn-ssh

# default shell.
SHELL ["/bin/sh", "-c"]

EXPOSE 8000
EXPOSE 3000

VOLUME /root/bk
RUN set -eux; \
    git config --global user.email "jianglibo@gmail.com"; \
    git config --global user.name "jianglibo"; \
    c="${CARGO_HOME}/config"; \
    echo "[source.crates-io]" >> $c; \
    echo "replace-with = 'sjtug'" >> $c; \
    echo "[source.ustc]" >> $c; \
    echo "registry = 'https://mirrors.ustc.edu.cn/crates.io-index'" >> $c; \
    echo "[source.sjtug]" >> $c; \
    echo "registry = 'https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index/'" >> $c; \
    cargo install systemfd cargo-watch

RUN set -eux; \
    yarn global add graphqurl

RUN set -eux; \
    curl -L https://github.com/hasura/graphql-engine/raw/master/cli/get.sh | bash; \
    hasura completion bash --file=/etc/bash_completion.d/hasura

