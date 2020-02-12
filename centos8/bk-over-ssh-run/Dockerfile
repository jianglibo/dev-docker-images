FROM jianglibo/c7-bk-over-ssh-cached as dev

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
