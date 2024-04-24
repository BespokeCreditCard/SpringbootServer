FROM openjdk:17-jdk-slim

WORKDIR /bespoke
COPY /target/*.war app.war
CMD ["java", "-jar", "app.war"]
