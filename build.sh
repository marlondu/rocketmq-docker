#!/bin/sh

# make sure you has installed docker
# Usage:
#   sh build.sh -v 4.3.1 
# default version or use -v
RMQ_VERSION=4.3.1
while getopts "v:" arg
do
    case $arg in
        v)
            RMQ_VERSION=$OPTARG
            echo "RMQ_VERSION=${RMQ_VERSION}"
            ;;
        ?)
            echo "only support -v option"
            exit 0
            ;;
    esac
done
# build rmq-namesrv
echo "start building rmq-namesrv..."
docker build -t rmq-namesrv --build-arg RMQ_VERSION=${RMQ_VERSION} ./rmq-namesrv
# build rmq-broker
echo "start building rmq-broker..."
docker build -t rmq-broker --build-arg RMQ_VERSION=${RMQ_VERSION} ./rmq-broker
# pull rocket-console-ng
docker pull styletang/rocketmq-console-ng