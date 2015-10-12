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
    && wget http://download.redis.io/releases/redis-2.8.13.tar.gz -O redis.tar.gz \
    && tar -zxvf redis.tar.gz \
    && cd redis-2.8.13 \
    && make \
    && make install \
    && mkdir /etc/redis \
#    && { \
#                echo; \
#                echo 'daemonize yes;'; \
#		echo 'loglevel notice;'; \
#		echo 'logfile /var/log/redis.log;'; \
#		echo 'dir ./;'; \
#         } >> /etc/redis/redis.conf \
#    && { \
#         echo  'vm.overcommit_memory = 1'; \ 
#        } >>/etc/sysctl.conf      
#    && yum remove $buildDeps


EXPOSE 6379

COPY redis.conf /etc/redis/redis.conf
COPY redis.sh /etc/init.d/redis

RUN chmod +x /etc/init.d/redis \
    && chkconfig --add redis \
    && chkconfig redis on

RUN  mkdir -p /data/run/redis/ && mkdir -p /data/log/redis/
VOLUME /data
WORKDIR /data

CMD ["/usr/local/bin/redis-server"]

