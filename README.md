# rocketmq-docker



## Usage

#### Step One:

```sh
$ git clone git@github.com:marlondu/rocketmq-docker.git
$ cd rocketmq-docker
$ # run with shell
$ sh build.sh -v 4.3.1 -t 4.3.1
$ sh start.sh -t 4.3.1
$ # ---------------------------------------------
$ # or run with docker-compose
$ # 1. Build Image
$ #   remove rmq-base's comment and then
$ docker-compose build
$ # 2. Start container
$ #   add rmq-base's comment and then
$ docker-compose up
```

#### Step Two:

add `127.0.0.1 rmq-broker` in your hosts file

then use command `ping rmq-broker`  in console to verify if work.