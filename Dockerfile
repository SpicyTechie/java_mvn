FROM maven:3.9.6-eclipse-temurin-11 AS build
WORKDIR /build

COPY my-app/pom.xml my-app/
COPY my-app/src my-app/src

WORKDIR /build/my-app
RUN mvn clean package -DskipTests

FROM eclipse-temurin:11-jre
WORKDIR /app

COPY --from=build /build/my-app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
