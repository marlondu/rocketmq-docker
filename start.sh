#!/bin/sh

# java opts
Xmx=512m
Xms=512m
Xmn=128m

# create network
docker network create -d bridge rmq-net
# run rocketmq name server
docker run -d -t -e "Xmx=${Xmx}" -e "Xms=${Xms}" -e "Xmn=${Xmn}" -e "ROCKETMQ_HOME=/root" \ 
    -p 9876:9876 --name rmq-namesrv --network rmq-net rmq-namesrv

# run rocketmq name server
docker run -d -t -e "Xmx=${Xmx}" -e "Xms=${Xms}" -e "Xmn=${Xmn}" -e "ROCKETMQ_HOME=/root" \ 
    -p 10911:10911 -p 10909:10909 --name rmq-broker --network rmq-net rmq-broker

docker run -d -t -e "JAVA_OPTS=-Drocketmq.namesrv.addr=127.0.0.1:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false" \
    -p 8080:8080 --name rmq-console-ng --network rmq-net styletang/rocketmq-console-ng

