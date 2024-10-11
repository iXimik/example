FROM alpine: lates
RUN apk add-no-cache mysql-client
ENTRYPOINT ["mysql"]
