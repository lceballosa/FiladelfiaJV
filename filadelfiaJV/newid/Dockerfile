# Etapa 1: Construcción con Maven
FROM maven:3.8.7-eclipse-temurin-17 AS build

WORKDIR /

# Copia los archivos del proyecto al contenedor
COPY . .

# Compila el proyecto y genera el JAR en /app/target/
RUN mvn clean package -DskipTests

# Etapa 2: Imagen más ligera para ejecutar la aplicación
FROM openjdk:17-jdk-slim

WORKDIR /

# Copia el JAR generado en la etapa de construcción
COPY --from=build /target/newid-0.0.1-SNAPSHOT.jar app.jar

# Expón el puerto donde correrá la aplicación
EXPOSE 8081

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]