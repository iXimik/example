# Используем официальный образ Alpine
FROM alpine:latest

# Установка необходимых пакетов
RUN apk add --no-cache python3 py3-pip

# Установка Ansible
RUN pip3 install ansible

# Установка рабочего каталога
#WORKDIR /ansible

# Установка точки входа (опционально)
ENTRYPOINT ["ansible"]
