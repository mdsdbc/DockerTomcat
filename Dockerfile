FROM centos:7

MAINTAINER mdsdbc@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat

#RUN yum -y update
#RUN yum -y upgrade
RUN yum -y install epel-release && \
    yum -y update && \
    yum -y clean all
RUN yum -y install tomcat-native
RUN yum -y install java 
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.51/* /opt/tomcat/.

#RUN value=`cat /opt/tomcat/conf/server.xml` && echo "${value//8080/4041}" >| /opt/tomcat/conf/server.xml

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war

EXPOSE 4041

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
