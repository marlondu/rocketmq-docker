FROM java:8u111-jre-alpine
# set rocketmq version
ARG RMQ_VERSION=4.3.1
# use root user
USER root
# worker dir in /root
WORKDIR /root
RUN wget http://mirror.bit.edu.cn/apache/rocketmq/${RMQ_VERSION}/rocketmq-all-${RMQ_VERSION}-bin-release.zip -O rocketmq.zip \
    && unzip rocketmq.zip \
    && mv rocketmq-all*/* ./ \
    && rm -rf rocketmq-all* \
    && rm rocketmq.zip \
    && sed -i 's/-Xms[0-9]*[mg]/-Xms${Xms}/g' bin/run*.sh \
    && sed -i 's/-Xmx[0-9]*[mg]/-Xmx${Xmx}/g' bin/run*.sh \
    && sed -i 's/-Xmn[0-9]*[mg]/-Xmn${Xmn}/g' bin/run*.sh \
    && sed -i '$a brokerIP1 = rmq-broker' conf/broker.conf
