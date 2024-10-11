FROM alpine:latest

LABEL maintainer="niuyuxian <ncc0706@gmail.com>"

ENV TZ=Asia/Shanghai \
    LANG=en_US.UTF-8

VOLUME /data

RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v$(head -c3 /etc/alpine-release)/main\nhttps://mirror.tuna.tsinghua.edu.cn/alpine/v$(head -c3 /etc/alpine-release)/community" > /etc/apk/repositories \
    && apk add --update tzdata mysql mysql-client \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && addgroup mysql mysql \
    && chown -R mysql:mysql /data \
    && mkdir /scripts \
    && rm -f /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf
COPY startup.sh /scripts/startup.sh

RUN chmod +x /scripts/startup.sh


EXPOSE 3306
ENTRYPOINT ["/scripts/startup.sh"]
#USER mysql
