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
    && cp src/redis-trib.rb  /usr/local/bin \
    && cp redis.conf /data/redis.conf \
    && cp utils/create-cluster/create-cluster /usr/local/bin \
    && rm -rf /usr/src/

RUN set -x \
     && gem sources -a https://ruby.taobao.org/ \
     && gem sources --remove https://rubygems.org/ \
     && gem install redis -V



EXPOSE 6379
VOLUME /data
WORKDIR /data

ADD manage.sh manage.sh
RUN chmod 775 manage.sh \
    && chown redis:redis manage.sh

ENTRYPOINT  ["/data/manage.sh"]
CMD ["bash"]
