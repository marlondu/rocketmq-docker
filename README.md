# rocketmq-docker



## Usage

#### Step One:

```sh
$ git clone git@github.com:marlondu/rocketmq-docker.git
$ cd rocketmq-docker
$ # run with shell
$ sh build.sh -v 4.3.1
$ sh start.sh
$ # or run with docker-compose
$ docker-compose up
```

#### Step Two:

add `127.0.0.1 rmq-broker` in your hosts file

then use command `ping rmq-broker`  in console to verify if work.