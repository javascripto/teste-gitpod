FROM gitpod/workspace-full:latest

USER root

# Install MySQL
RUN apt update \
 && apt install -y mysql-server mysql-client mycli \
 && apt clean && rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/* \
 && mkdir /var/run/mysqld \
 && chown -R gitpod:gitpod /etc/mysql /var/run/mysqld /var/log/mysql /var/lib/mysql /var/lib/mysql-files /var/lib/mysql-keyring /var/lib/mysql-upgrade

# Install our own MySQL config
COPY mysql.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Install default-login for MySQL clients
COPY client.cnf /etc/mysql/mysql.conf.d/client.cnf

COPY mysql-bashrc-launch.sh /etc/mysql/mysql-bashrc-launch.sh

USER gitpod

RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.bashrc
RUN echo "/etc/mysql/mysql-bashrc-launch.sh" >> ~/.zshrc

# More information: https://www.gitpod.io/docs/42_config_docker/
# https://github.com/gitpod-io/workspace-images/blob/master/mysql/Dockerfile
