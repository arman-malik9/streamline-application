FROM khipu/openjdk17-alpine
MAINTAINER Arman Malik          
WORKDIR /streamline-application
COPY ./target/*.jar /streamline-application/web-app.jar
EXPOSE 8070
ENTRYPOINT ["java","-jar","web-app.jar"]




