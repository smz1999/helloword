FROM tomcat
MAINTAINER "Wei Wang <wwyhy520@163.com>"
ADD target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
