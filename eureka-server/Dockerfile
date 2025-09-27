FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/api-gateway-1.0.0.jar app.jar
COPY . /app
EXPOSE 8761
ENTRYPOINT ["java", "-jar", "app.jar"]
