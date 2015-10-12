# DOCKER-VERSION    1.8.2 
#
# Dockerizing Redis: Dockerfile for building Redis images
#
FROM centos
MAINTAINER skycn <raosungang@hotmail.com>

RUN groupadd -r redis && useradd -r -g redis redis

RUN buildDeps='curl wget gcc libc6-dev libpcre3-dev libssl-dev make' \
    && set -x \
    && yum install -y $buildDeps \	
    && cd /usr/src \
    && wget http://download.redis.io/releases/redis-3.0.4.tar.gz -O redis.tar.gz \
    && tar -zxvf redis.tar.gz \
    && cd redis* \
    && make \
    && make install \
    && mkdir /etc/redis \

EXPOSE 6379
#COPY redis.sh /etc/init.d/redis

#RUN chmod +x /etc/init.d/redis \
#    && chkconfig --add redis \
#    && chkconfig redis on


RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data

ENTRYPOINT  ["/usr/local/bin/redis-server"]
#CMD ["/usr/local/bin/redis-server"]

