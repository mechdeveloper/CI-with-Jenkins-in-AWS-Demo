FROM tomcat:8.0

MAINTAINER 'Ashish Singh Baghel'

COPY project/target/target/*.war /usr/local/tomcat/webapps/
