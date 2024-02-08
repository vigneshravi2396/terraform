FROM eclipse-temurin:17-jdk-alpine
# RUN apk add maven
WORKDIR /app 
COPY . /app
