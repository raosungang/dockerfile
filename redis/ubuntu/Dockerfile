# DOCKER-VERSION    1.8.2
#
# Dockerizing Redis: Dockerfile for building Redis images
#
FROM ubuntu:utopic
MAINTAINER skycn <raosungang@hotmail.com>

RUN groupadd -r redis && useradd -r -g redis redis
#ENV DATA_DIR /var/lib/redis

#change sources
RUN  sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
ADD ./sources.list /etc/apt/sources.list

# install redis
RUN apt-get update && \
    apt-get install -y redis-server
    

EXPOSE 6379

RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data
CMD ["/usr/bin/redis-server"]
