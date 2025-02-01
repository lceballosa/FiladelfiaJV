# Usa la imagen oficial de OpenJDK 17 como base
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo dentro del contenedor
#WORKDIR /

# Copia el archivo JAR generado en el directorio de trabajo
COPY target/newid-0.0.1-SNAPSHOT.jar app.jar

# Expón el puerto en el que corre la aplicación Spring Boot (por defecto es el 8080)
EXPOSE 8081

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]