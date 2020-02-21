FROM centos:8

# default shell.
SHELL ["/bin/sh", "-c"]

RUN set -eux; \
    curl -sL https://rpm.nodesource.com/setup_13.x | bash -; \
    yum install -y nodejs; \
    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo; \
    yum install -y yarn git libpng-devel; \
    yarn global add gatsby-cli
