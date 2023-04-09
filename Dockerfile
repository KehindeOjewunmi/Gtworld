#FROM maven:3.5-jdk-8-alpine AS build
#WORKDIR /app
#COPY . .
#RUN mvn package

FROM tomcat:8.0.20-jre8 as final
# Dummy text to test 
COPY target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
