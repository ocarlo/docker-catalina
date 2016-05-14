FROM debian

RUN \
	 apt-get update -y && \
	 apt-get upgrade -y && \
	 apt-get install -y curl

RUN \
    curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz > /jdk-8u92-linux-x64.tar.gz && \
    tar -zxvf /jdk-8u92-linux-x64.tar.gz && \
    rm /jdk-8u92-linux-x64.tar.gz
ENV JAVA_HOME /jdk1.8.0_92
ENV PATH $PATH:$JAVA_HOME/bin

RUN \
   curl -v -j -k -L http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz > /apache-tomcat-8.0.33.tar.gz && \
   tar -zxvf /apache-tomcat-8.0.33.tar.gz && \
   mv /apache-tomcat-8.0.33 /tomcat && \
   rm /apache-tomcat-8.0.33.tar.gz

ENV CATALINA_HOME /tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

ENTRYPOINT [ "/tomcat/bin/catalina.sh",  "run" ]
