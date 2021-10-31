FROM maven:3.3-jdk-8-alpine as builder
WORKDIR /app
COPY pom.xml ./
RUN mvn dependency:resolve
COPY ./ ./
RUN mvn package -DskipTests

FROM openjdk:8-jre-alpine3.7
WORKDIR /app
COPY --from=builder /app/target/*.jar java_app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "java_app.jar"]