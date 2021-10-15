FROM tomcat:9.0
RUN apt install tomcat9-admin -y
ADD tomcat-users.xml /usr/local/tomcat/conf
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]