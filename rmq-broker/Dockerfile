FROM rocketmq-base:4.3.1
# export port
EXPOSE 10911 10909
CMD [ "sh", "bin/mqbroker", "-n", "rmq-namesrv:9876", "-c","conf/broker.conf" ]
