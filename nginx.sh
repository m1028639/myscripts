
# myscripts
#!/bin/bash
apt-get update
wget -qO- https://get.docker.com/ | sh


docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR=clientnginx01.westus.cloudapp.azure.com -e JENKINS_ADDR=clientjenkins01.westus.cloudapp.azure.com -e SONAR_ADDR=clientsonar01.westus.cloudapp.azure.com preetick/nginx-devops:v12

