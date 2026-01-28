FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/my-app-1.0.0.jar app.jar
EXPOSE 8085
RUN mvn clean package
CMD ["java","-jar","App.java"]
