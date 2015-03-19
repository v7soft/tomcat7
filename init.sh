#!/usr/bin/env bash

#I guess smtp exits on host and relay opened for containers so let container localhost forward to hosts smtp.
# Or set SMTPSERVER host:ip to valid smtp
[[ -v SMTPSERVER ]] || SMTPSERVER=$(ip ro | awk '/default/ { print $3 }'):25
/usr/bin/simpleproxy -d -L 25 -R $SMTPSERVER
touch /data/*/conf/etc/nothing && cd /data/*/conf/etc && tar c *|tar xC /etc
[[ -v TOMCAT7PASS ]] && sed -i 's/tomcatpassfordeploy/'${TOMCAT7PASS}'/' /etc/tomcat7/tomcat-users.xml
ls /data/*/conf/init.sh 2>/dev/null 1>/dev/null && /data/*/conf/init.sh

service tomcat7 start
