FROM maven:3-alpine as build
COPY . .

RUN ls && \
    mvn --version && mvn package

FROM tomcat:8.0-alpine
LABEL maintainer="mechashishsingh@gmail.com"

COPY --from=build project/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
