# DOCKER-VERSION    1.8.2 
#
# Dockerizing Redis: Dockerfile for building Redis images

FROM jeff/centos
MAINTAINER skycn <raosungang@hotmail.com>

RUN groupadd -r redis && useradd -r -g redis redis
RUN mkdir /data && chown redis:redis /data

# INSTALL tcl
#RUN  set -x \
#    && cd /usr/src \
#    && wget http://downloads.sourceforge.net/tcl/tcl8.6.3-src.tar.gz \
#    && tar -zxvf tcl8.6.3-src.tar.gz \
#    && cd tcl8.6.3/unix/ \
#    && ./configure \
#    && make \
#    && make install \
#    && rm -rf /usr/src/

# Install Redis
RUN  set -x \
    && cd /usr/src \
    && yum install ruby jemalloc wget gcc libc6-dev libpcre3-dev libssl-dev make  -y \
    && wget http://download.redis.io/releases/redis-3.0.4.tar.gz -O redis.tar.gz \
    && tar -zxvf redis.tar.gz \
    && cd redis* \
    && make \
    && make install \
    && cp redis.conf /data/redis.conf \
    && sed -i 's/appendonly no/appendonly yes/' /data/redis.conf \
    && rm -rf /usr/src/ \
    && yum remove -y ruby jemalloc wget gcc libc6-dev libpcre3-dev libssl-dev make


USER redis
EXPOSE 6379
VOLUME /data
WORKDIR /data


ENTRYPOINT  ["redis-server","/data/redis.conf"]
