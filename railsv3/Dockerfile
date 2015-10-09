FROM ubuntu:utopic
MAINTAINER Skycn <raosungang@hotmail.com>

# Just use bash.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Debian complains about the terminal environment on docker.use this.
#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selectinos

# Change sources
RUN  sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
ADD ./sources.list /etc/apt/sources.list

# Install base packages
RUN apt-get update -y && apt-get install -y curl wget git 
RUN rm -rf /var/cache/apt/* /tmp/*

#Install RVM requirements packages
RUN buildDeps='patch gawk  nodejs g++ gcc make libc6-dev patch libreadline6-dev zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev' \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* /tmp/* \

#RUN wget http://nginx.org/keys/nginx_signing.key && \
#  sudo apt-key add nginx_signing.key  && \
#  deb http://nginx.org/packages/ubuntu/ utopic nginx && \
#  deb-src http://nginx.org/packages/ubuntu/ utopic nginx
# RUN apt-get update && \
#  apt-get install nginx

# Force sudoers to not being asked the password
RUN echo %sudo    ALL=NOPASSWD: ALL >> /etc/sudoers

# Add a user just for runing the app
RUN useradd -m -G sudo app

USER app
WORKDIR /home/app

# rvm install
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && curl -sSL https://get.rvm.io | bash -s stable \ 
    && source ~/.rvm/scripts/rvm
# ruby install
RUN  source ~/.bash_profile  \
     && rvm requirements \
     && rvm install 2.2.2 

RUN  source ~/.bash_profile\
     && gem sources -a https://ruby.taobao.org/ \
     && gem sources --remove https://rubygems.org/ \
     && rm -rf /home/app/.rvm/src/*

ADD ./docker-entrypoint.sh /home/app/docker-entrypoint.sh
#RUN sudo chmod +x /home/app/docker-entrypoint.sh
#ADD setup.sh /home/app/setup.sh
#ENV RAILS_ENV=prodcution

EXPOSE 3000:3000

RUN  apt-get purge -y --auto-remove $buildDeps

ENTRYPOINT  /home/app/docker-entrypoint.sh
