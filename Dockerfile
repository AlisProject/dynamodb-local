from openjdk:8-jre

RUN mkdir /var/dynamodb_local
WORKDIR /var/dynamodb_local
VOLUME ["/dynamodb_local_db"]

RUN curl -O https://s3-ap-northeast-1.amazonaws.com/dynamodb-local-tokyo/dynamodb_local_latest.tar.gz && \
    tar xf ./dynamodb_local_latest.tar.gz && \
    rm ./dynamodb_local_latest.tar.gz

COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000

CMD ["-sharedDb", "-dbPath", "/dynamodb_local_db", "-port", "8000"]
