FROM centos:8

RUN set -eux; \
	yum install -y \
			gzip \
			tar \
			\
	# jlink --strip-debug on 13+ needs objcopy: https://github.com/docker-library/openjdk/issues/351
	# Error: java.io.IOException: Cannot run program "objcopy": error=2, No such file or directory
			binutils \
	# java.lang.UnsatisfiedLinkError: /usr/java/openjdk-12/lib/libfontmanager.so: libfreetype.so.6: cannot open shared object file: No such file or directory
	# https://github.com/docker-library/openjdk/pull/235#issuecomment-424466077
	freetype fontconfig \
		; \
	rm -rf /var/cache/yum

	# Default to UTF-8 file.encoding
	ENV LANG en_US.UTF-8

	ENV JAVA_HOME /usr/java/openjdk-13
	ENV PATH $JAVA_HOME/bin:$PATH

	# https://jdk.java.net/
	# > Java Development Kit builds, from Oracle
	ENV JAVA_VERSION 13.0.2
	ENV JAVA_URL https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz
	ENV JAVA_SHA256 acc7a6aabced44e62ec3b83e3b5959df2b1aa6b3d610d58ee45f0c21a7821a71

	RUN set -eux; \
		\
		curl -fL -o /openjdk.tgz "$JAVA_URL"; \
		echo "$JAVA_SHA256 */openjdk.tgz" | sha256sum -c -; \
		mkdir -p "$JAVA_HOME"; \
		tar --extract --file /openjdk.tgz --directory "$JAVA_HOME" --strip-components 1; \
		rm /openjdk.tgz; \
		\
		# https://github.com/oracle/docker-images/blob/a56e0d1ed968ff669d2e2ba8a1483d0f3acc80c0/OracleJava/java-8/Dockerfile#L17-L19
		ln -sfT "$JAVA_HOME" /usr/java/default; \
		ln -sfT "$JAVA_HOME" /usr/java/latest; \
		for bin in "$JAVA_HOME/bin/"*; do \
			base="$(basename "$bin")"; \
			[ ! -e "/usr/bin/$base" ]; \
			alternatives --install "/usr/bin/$base" "$base" "$bin" 20000; \
		done; \
		\
		# https://github.com/docker-library/openjdk/issues/212#issuecomment-420979840
		# https://openjdk.java.net/jeps/341
		java -Xshare:dump; \
		\
		# basic smoke test
		java --version; \
		javac --version

		# https://docs.oracle.com/javase/10/tools/jshell.htm
		# https://docs.oracle.com/javase/10/jshell/
		# https://en.wikipedia.org/wiki/JShell
	RUN set -eux; \
		echo "export PATH=$PATH" >> /etc/profile; \
		echo "export JAVA_HOME=/usr/java/openjdk-13" >> /etc/profile; \
		echo "export PATH=$PATH" >> ${HOME}/.bashrc; \
		echo "export JAVA_HOME=/usr/java/openjdk-13" >> ${HOME}/.bashrc
	RUN set -eux; \
		\
		curl -fL -o /mvn.tar.gz http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz; \
		mkdir /maven; \
		tar --extract --file /mvn.tar.gz --directory /maven; \
		cd /usr/bin; \
		ln -s /maven/apache-maven-3.6.3/bin/mvn; \
		ln -s /maven/apache-maven-3.6.3/bin/mvnDebug; \
		cd / 
CMD ["jshell"]
