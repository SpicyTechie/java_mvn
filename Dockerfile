# ---------- STAGE 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy only pom.xml first (better caching)
COPY my-app/pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY my-app/src ./src

# Build the jar
RUN mvn clean package -DskipTests

# ---------- STAGE 2: Run ----------
FROM eclipse-temurin:17-jre

WORKDIR /app

COPY --from=builder /build/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
