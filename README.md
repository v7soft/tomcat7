# tomcat7
Tomcat 7 with manager for deploy

# ToDo
Write a manual who to use it

#Tip
docker run -itd --cap-add=SYS_PTRACE --security-opt=apparmor:unconfined -e TOMCAT7PASS=VerySecretPass -v /data/supersite:/data/supersite --hostname docker.supersite.com --name supersite v7soft/tomcat7
