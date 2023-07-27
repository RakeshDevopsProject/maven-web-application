FROM  tomcat:9.0.78-jdk11-corretto-al2
COPY target/maven-web-application*.war /usr/local/tomcat/maven-web-application*.war

