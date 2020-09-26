FROM tomcat:latest
RUN apt-get update
RUN apt-get install maven -y && apt-get install git -y && apt-get install mc -y 
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello /usr/boxfuse
RUN mv webapps webapps2 && mv webapps.dist/ webapps
WORKDIR /usr/boxfuse
RUN mvn package
RUN cp /usr/boxfuse/target/hello-1.0.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]


