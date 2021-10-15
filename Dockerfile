FROM tomcat:9
RUN apt update
#RUN apt install tomcat9 -y
#RUN apt install tomcat9-admin -y
ADD tomcat-users.xml /usr/local/tomcat/conf
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
ADD context.xml /usr/local/tomcat/webapps/manager/META-INF
EXPOSE 8080
CMD ["catalina.sh", "run"]