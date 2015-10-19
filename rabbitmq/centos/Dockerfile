FROM jeff/centos

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r rabbitmq && useradd -r -d /var/lib/rabbitmq -m -g rabbitmq rabbitmq

RUN yum -y update && yum  install -y curl erlang && rm -rf /var/cache/yum/*

RUN    yum install -y http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.6/rabbitmq-server-3.5.6-1.noarch.rpm \ 
      && rm -rf /var/cache/yum/* \
      && mkdir -p /var/lock/subsys/ \
      && /usr/sbin/rabbitmq-server -detached

RUN chmod 777 /etc/rabbitmq/
RUN echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config
RUN rabbitmq-plugins enable --offline rabbitmq_management
VOLUME /var/lib/rabbitmq

# add a symlink to the .erlang.cookie in /root so we can "docker exec rabbitmqctl ..." without gosu
RUN ln -sf /var/lib/rabbitmq/.erlang.cookie /root/

#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5672
ENTRYPOINT ["rabbitmq-server"]
