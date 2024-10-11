FROM alpine: 3.14
2 RUN apk add-no-cache mysql-client
3 ENTRYPOINT ["mysql"]
