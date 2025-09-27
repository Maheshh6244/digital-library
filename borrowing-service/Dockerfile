FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/borrowing-service-1.0.0.jar app.jar
COPY . /app
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "app.jar"]
