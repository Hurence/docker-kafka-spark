#!/bin/bash

:

rm /tmp/*.pid


/etc/init.d/nginx start
service sshd start

echo "Starting kafka"
cd $KAFKA_HOME
#echo "host.name=sandbox" >> config/server.properties
nohup bin/zookeeper-server-start.sh config/zookeeper.properties > zookeeper.log 2>&1 &
JMX_PORT=10101 nohup bin/kafka-server-start.sh config/server.properties > kafka.log 2>&1 &



CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
	service sshd stop
	/usr/sbin/sshd -D -d
else
	/bin/bash -c "$*"
fi