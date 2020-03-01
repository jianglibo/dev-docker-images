FROM jianglibo/c7-rust-vcpkg-yarn-ssh

# default shell.
SHELL ["/bin/sh", "-c"]

EXPOSE 8000
EXPOSE 3000

RUN set -eux; \
    git config --global user.email "jianglibo@gmail.com"; \
    git config --global user.name "jianglibo"; \
    cargo install systemfd cargo-watch; \
    yarn add global hasura; \
    hasura completion bash --file=/etc/bash_completion.d/hasura;
