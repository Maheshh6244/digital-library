FROM openjdk:17-jdk-slim
WORKDIR /app
COPY pom.xml .
COPY . .
EXPOSE 8083
ENTRYPOINT ["java", "BorrowingController.java"]
