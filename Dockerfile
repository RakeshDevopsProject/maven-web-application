FROM  alpine
RUN apk add openjdk11
RUN apk add wget
ENV Tomcat_User=/opt/tomcat
    #Catalina_Home=/opt/tomcat
RUN adduser -D tomcat \
    && mkdir $Tomcat_User \
    && cd /tmp \
    && wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz \
    && tar xfz apache-tomcat-9.0.73.tar.gz \
    && mv apache-tomcat-9.0.73/* $Tomcat_User \
    && chown -R tomcat:tomcat $Tomcat_User \
    && chmod +x $Tomcat_User/bin/*.sh
ExPOSE 8080
USER tomcat
COPY /opt/tomcat /usr/local/tomcat
COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

