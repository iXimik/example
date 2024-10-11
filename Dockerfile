# Используйте официальный образ Alpine
FROM alpine:latest

# Укажите информацию о поддержке образа
LABEL maintainer="niuyuxian <ncc0706@gmail.com>"

# Установите переменные окружения
ENV TZ=Asia/Shanghai LANG=en_US.UTF-8

# Определите том для хранения данных
VOLUME /data

# Выполните необходимые команды для установки и настройки окружения
RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/main\nhttps://mirror.tuna.tsinghua.edu.cn/alpine/v3.15/community" > /etc/apk/repositories \
    && apk add --update tzdata mysql mysql-client \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && adduser -D mysql \
    && addgroup mysql \
    && chown -R mysql:mysql /data \
    && mkdir /scripts \
    && rm -f /var/cache/apk/*

# Откройте порт, если требуется (например, для MySQL)
EXPOSE 3306

# Укажите команду по умолчанию (если требуется)
CMD ["mysqld"]



