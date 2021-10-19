FROM tomcat:9
RUN apt update
ADD tomcat-users.xml /usr/local/tomcat/conf
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
ADD context.xml /usr/local/tomcat/webapps/manager/META-INF
ADD /var/lib/jenkins/workspace/Build-war-docker/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]