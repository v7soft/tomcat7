FROM phusion/baseimage:latest

MAINTAINER mkostrikin@gmail.com 

ENV DEBIAN_FRONTEND noninteractive

RUN add-apt-repository -y ppa:webupd8team/java && apt-get update && apt-get install -y debconf-utils &&\
echo oracle-java7-installer  shared/accepted-oracle-license-v1-1  boolean true| debconf-set-selections &&\
locale-gen && locale-gen ru_RU.UTF-8 &&\
apt-get -y dist-upgrade && apt-get install -y oracle-java7-installer && apt-get install -y tomcat7 tomcat7-examples tomcat7-docs tomcat7-admin simpleproxy &&
rm /etc/service/sshd/down && dpkg-reconfigure openssh-server &&
apt-get clean &&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL https://raw.githubusercontent.com/v7soft/tomcat7/master/init.sh > /etc/my_init.d/init.sh && chmod +x /etc/my_init.d/init.sh
