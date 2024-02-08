### Run spring application ###

1. Build docker container with base image as ```eclipse-temurin:17-jdk-alpine```
2. Set WORKDIR /app
3. COPY current directory files to WORKDIR
4. Add ENTRYPOINT  as ```./mvnw spring-boot:run``` and expose the port 8080 to host
5. App should be running and http://localhost:8080 should be working

