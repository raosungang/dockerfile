# DOCKER-VERSION    1.8.2 
#
# Dockerizing Redis: Dockerfile for building Redis images
#
FROM jeff/centos
MAINTAINER skycn <raosungang@hotmail.com>

RUN groupadd -r redis && useradd -r -g redis redis\
    && mkdir /data && chown redis:redis /data

RUN buildDeps='curl wget gcc libc6-dev libpcre3-dev libssl-dev make' \
    && set -x \
    && yum install -y $buildDeps \	
    && cd /usr/src \
    && wget http://download.redis.io/releases/redis-2.8.13.tar.gz -O redis.tar.gz \
    && tar -zxvf redis.tar.gz \
    && cd redis-2.8.13 \
    && make \
    && make install \
    && cp redis.conf /data/redis.conf \
    && sed -i 's/appendonly no/appendonly yes/' /data/redis.conf \
    && rm -rf /usr/src/ \

EXPOSE 6379

VOLUME /data
WORKDIR /data

ENTRYPOINT  ["redis-server","/data/redis.conf"]
