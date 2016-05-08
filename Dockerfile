FROM debian

RUN \
	 apt-get update -y && \
	 apt-get upgrade -y && \
	 apt-get install -y curl

RUN \
    curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.tar.gz > /jdk-8u73-linux-x64.tar.gz && \
    tar -zxvf /jdk-8u73-linux-x64.tar.gz && \
    rm /jdk-8u73-linux-x64.tar.gz
ENV JAVA_HOME /jdk1.8.0_73
ENV PATH $PATH:$JAVA_HOME/bin

RUN \
   curl -v -j -k -L http://www.mirrorservice.org/sites/ftp.apache.org/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz > apache-tomcat-8.0.33.tar.gz && \
   tar -zxvf /apache-tomcat-8.0.33.tar.gz && \
   rm /apache-tomcat-8.0.33.tar.gz

ENV CATALINA_HOME /apache-tomcat-8.0.33
ENV PATH $PATH:$CATALINA_HOME/bin

ENTRYPOINT [ "/apache-tomcat-8.0.33/bin/catalina.sh",  "run" ]
