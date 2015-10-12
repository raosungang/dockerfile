#
# MAINTAINER        skycn<raosungang@hotmail.com>
# DOCKER-VERSION    1.8.2
#
# Dockerizing CentOS7: Dockerfile for building CentOS images
#

FROM jeff/centos
MAINTAINER skycn<raosungang@hotmail.com>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

#ENV MONGO_MAJOR 3.1
#ENV MONGO_VERSION 3.1.8

RUN     set -x \
        && curl -SL https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-3.0.6.tgz  -o mongodb.tar.gz \
        && mkdir -p /usr/src/mongo \
        && tar -xzf mongodb.tar.gz -C /usr/src/mongo --strip-components=1 \
        && rm mongodb.tar.gz \
        && mv /usr/src/mongo/bin/ /usr/local/

RUN mkdir -p /data/db && chown -R mongodb:mongodb /data/db
VOLUME /data/db

EXPOSE 27017

ENTRYPOINT ["mongod"]

