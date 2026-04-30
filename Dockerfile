FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
RUN apk add --no-cache maven
COPY pom.xml ./
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/BusinessProject-0.0.1-SNAPSHOT.jar"]
