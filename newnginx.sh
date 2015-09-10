# myscripts
#!/bin/bash
apt-get update
wget -qO- https://get.docker.com/ | sh


docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR=mtreemtnginx01.southeastasia.cloudapp.azure.com -e JENKINS_ADDR=http://10.0.2.8:8080/jenkins -e SONAR_ADDR=http://10.0.2.7:9000/sonar preetick/nginx-devops:v13
