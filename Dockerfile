FROM gradle:4.3-jdk-alpine
WORKDIR /orderbird
ADD --chown=gradle ./java/spring-boot-project /orderbird
EXPOSE 8080
CMD ["gradle", "--stacktrace", "run"]
