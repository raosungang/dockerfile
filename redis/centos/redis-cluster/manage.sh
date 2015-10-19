#!/bin/bash
cd /data
export IPADDR=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
echo $IPADDR
sed -i 's/appendonly no/appendonly yes/' redis.conf
sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' redis.conf
sed -i 's/# cluster-node-timeout 15000/cluster-node-timeout 15000/g' redis.conf
sed -i 's/# cluster-config-file nodes.*/cluster-config-file nodes-'$IPADDR'.conf/g' redis.conf
redis-server redis.conf
~                    
