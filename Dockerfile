FROM ubuntu
RUN apt update
RUN apt install tomcat9 -y
RUN apt install tomcat9-admin -y
ADD tomcat-users.xml /var/lib/tomcat9/conf
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]