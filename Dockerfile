FROM jenkins/jenkins:lts

USER root

# Установка Docker
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jenkins
