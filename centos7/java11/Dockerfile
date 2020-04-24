FROM centos:8

# copy from https://github.com/rust-lang/docker-rust/blob/master/1.40.0/stretch/Dockerfile


RUN set -eux; \
    yum -y rm java-1.8.0-openjdk java-1.8.0-openjdk-devel; \
    yum install -y java-11-openjdk java-11-openjdk-devel; \
    ar="apache-maven-3.6.3-bin.tar.gz"; \
    curl -OL "https://mirror.bit.edu.cn/apache/maven/maven-3/3.6.3/binaries/${ar}"; \
    tar zxf $ar; \
    rm -f $ar


RUN set -eux; \
    yum install -y openssh-server openssh-clients git; \
    mkdir /var/run/sshd; \
    echo 'root:root' | chpasswd; \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    /usr/bin/ssh-keygen -A;

ENV PATH=/apache-maven-3.6.3/bin:$PATH; \
    JAVA_HOME=/usr/lib/jvm/java-openjdk

RUN set -eux; \
    echo "export PATH=$PATH" >> /etc/profile; \
    echo "export PATH=$PATH" >> ${HOME}/.bashrc; \
    echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile; \
    echo "export JAVA_HOME=$JAVA_HOME" >> ${HOME}/.bashrc

EXPOSE 22
EXPOSE 8080
CMD ["/usr/sbin/sshd", "-D"]

# docker run -p 2227:22 -d jianglibo/java11
# docker build -t jianglibo/java11 .
