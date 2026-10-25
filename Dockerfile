FROM docker.io/eclipse-temurin:25-jre

WORKDIR /server

COPY --chmod=755 ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
