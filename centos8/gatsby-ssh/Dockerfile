FROM jianglibo/c8-gatsby

# docker run -p 222:22 --detach --name rust-dev-ssh centos7/rust-dev-ssh
# docker inspect --format '{{ .NetworkSettings.IPAddress }}' rust-dev-ssh


RUN yum install -y openssh-server openssh-clients
RUN set -eux; \
    mkdir /var/run/sshd; \
    echo 'root:root' | chpasswd; \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    /usr/bin/ssh-keygen -A;

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

