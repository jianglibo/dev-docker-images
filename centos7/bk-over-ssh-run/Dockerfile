FROM bk-over-ssh-cached-centos7 as dev

# docker build -t bk-over-ssh-run centos7\bk-over-ssh-run\
# docker run -ti --rm bk-over-ssh-run /bin/bash

# default shell.
SHELL ["/bin/sh", "-c"]

# every build should do git clone.
RUN source scl_source enable devtoolset-7 rh-git218; \
    set -eux; \
    cd /ws; \
    git clone https://github.com/jianglibo/bk-over-ssh.git; \
    cd /ws/bk-over-ssh; \
    ln -s /ws/target; \
    cargo build --release;


FROM centos:7
WORKDIR /root/
COPY --from=dev /ws/bk-over-ssh/target/release/bk-over-ssh .

CMD ["./bk-over-ssh"]
