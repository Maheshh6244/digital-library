FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/catalog-service-1.0.0.jar app.jar
COPY . /app
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "app.jar"]
