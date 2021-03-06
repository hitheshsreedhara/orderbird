FROM gradle:4.7-jdk-alpine

WORKDIR /opt/orderbird

ADD ./java/spring-boot-project/ /opt/orderbird

USER root

RUN chown -R gradle /opt/orderbird

USER gradle

EXPOSE 8080

CMD ["gradle", "--stacktrace", "run"]
