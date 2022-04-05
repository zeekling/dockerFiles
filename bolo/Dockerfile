FROM maven:3-jdk-8-alpine as MVN_BUILD

WORKDIR /opt/bolo/
ADD . /tmp
RUN cd /tmp && mvn package -DskipTests --settings settings.xml && mv target/bolo/* /opt/bolo/ \
    && cp -f /tmp/src/main/resources/docker/* /opt/bolo/WEB-INF/classes/

FROM openjdk:8-alpine
LABEL maintainer="Liang Ding<d@b3log.org>"

WORKDIR /opt/bolo/
COPY --from=MVN_BUILD /opt/bolo/ /opt/bolo/
RUN apk add --no-cache ca-certificates tzdata

ENV TZ=Asia/Shanghai
EXPOSE 8080

ENTRYPOINT [ "java", "-cp", "WEB-INF/lib/*:WEB-INF/classes", "org.b3log.solo.Starter" ]
