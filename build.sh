#!/bin/sh

# make sure you has installed docker
# Usage:
#   sh build.sh -v 4.3.1 
# default version or use -v
RMQ_VERSION=4.3.1
IMAGE_TAG=latest
while getopts "v:t:" arg
do
    case $arg in
        v)
            RMQ_VERSION=$OPTARG
            echo "RMQ_VERSION=${RMQ_VERSION}"
            ;;
        t)
            IMAGE_TAG=$OPTARG
            echo "IMAGE_TAG=${IMAGE_TAG}"
            ;;
        ?)
            echo "only support -v option(rocketmq versin) or -t option(image tag to build)"
            exit 0
            ;;
    esac
done

# build rmq-base
echo "start building rmq-base..."
docker build -t rocketmq-base:${IMAGE_TAG} --build-arg RMQ_VERSION=${RMQ_VERSION} ./rmq-base

# build rmq-namesrv
echo "start building rmq-namesrv..."
docker build -t rocketmq-namesrv:${IMAGE_TAG} ./rmq-namesrv
# build rmq-broker
echo "start building rmq-broker..."
docker build -t rocketmq-broker:${IMAGE_TAG} ./rmq-broker
# pull rocket-console-ng
docker pull styletang/rocketmq-console-ng