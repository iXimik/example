# Используйте официальный образ Alpine 3.14
FROM alpine:3.14

# Установите необходимые пакеты без кэша
RUN apk add --no-cache mysql-client

# Установите точку входа для контейнера
ENTRYPOINT ["mysql"]

