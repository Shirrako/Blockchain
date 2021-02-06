FROM maven:3.5-jdk-8 AS build  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /pom.xml clean package

FROM gcr.io/distroless/java  
COPY --from=build /target/blockchain1-1.0-SNAPSHOT.jar /target/blockchain1-1.0-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/target/blockchain1-1.0-SNAPSHOT.jar"] 
