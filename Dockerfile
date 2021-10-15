FROM tomcat:9
#ADD tomcat-users.xml /usr/local/tomcat/conf
EXPOSE 8080
CMD ["catalina.sh", "run"]