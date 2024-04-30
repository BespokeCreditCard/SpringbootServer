# Stage 1: Build stage
FROM maven:3.8.4-openjdk-17-slim AS build

# Copy Maven files for dependency resolution
COPY ./bespoke/pom.xml ./
COPY ./bespoke/.mvn .mvn

# Copy application source code
COPY ./bespoke/src src

ARG DBURL
ARG DBID
ARG DBPW
ARG S3Endpoint
ARG S3Region
ARG S3Accesskey
ARG S3Secretkey
ARG DALLE
ARG ElasticID
ARG ElasticPW
ARG springJwtSecret
ARG DEEPL

RUN echo "admin = ${DBURL}."
RUN echo "admin = ${DBID}."
RUN echo "admin = ${DBPW}."
RUN echo "admin = ${S3Endpoint}."

# Build the project and create the executable JAR
RUN mvn package

# Stage 2: Run stage
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /target/*.war app.war



CMD ["java", "-jar", "app.war"]