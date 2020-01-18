FROM bk-over-ssh-dev as dev

# docker build -t bk-over-ssh-run centos7\bk-over-ssh-run\
# docker run -ti --rm bk-over-ssh-run /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws/bk-over-ssh; \
    cargo build --release;


FROM centos:7
WORKDIR /root/
COPY --from=dev /ws/bk-over-ssh/target/release/bk-over-ssh .

CMD ["./bk-over-ssh"]
