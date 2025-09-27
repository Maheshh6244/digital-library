FROM openjdk:17-jdk-slim
WORKDIR /app
COPY pom.xml .
RUN mvn install pom.xml
COPY . .
EXPOSE 8083
ENTRYPOINT ["java", "BorrowingController.java"]
