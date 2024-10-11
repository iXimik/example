FROM alpine:latest
LABEL maintainer="niuyuxian <ncc0706@gmail.com>"
ENV TZ=Asia/Shanghai LANG=en_US.UTF-8

VOLUME /data

RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/main\nhttps://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/community" > /etc/apk/repositories \
    && apk add --update tzdata mysql mysql-client \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && adduser -D mysql \
    && addgroup mysql \
    && chown -R mysql:mysql /data \
    && mkdir /scripts \
    && rm -f /var/cache/apk/*
