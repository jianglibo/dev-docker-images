FROM jianglibo/c8-java-13

RUN set -eux; \
    yum install -y openssh-server openssh-clients; \
    mkdir /var/run/sshd; \
    echo 'root:root' | chpasswd; \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    /usr/bin/ssh-keygen -A;

RUN set -eux; \
	cd /; \
	mvn archetype:generate -DarchetypeGroupId=org.apache.wicket -DarchetypeArtifactId=wicket-archetype-quickstart -DarchetypeVersion=8.7.0 -DgroupId=com.mycompany -DartifactId=myproject -DarchetypeRepository=https://repository.apache.org/ -DinteractiveMode=false

EXPOSE 22
EXPOSE 8080
CMD ["/usr/sbin/sshd", "-D"]
