# myscripts
#!/bin/bash
apt-get update
wget -qO- https://get.docker.com/ | sh


docker run --name nginx_devops -d -p 80:80 -e NGINX_ADDR="$1.southeastasia.cloudapp.azure.com" -e JENKINS_ADDR=10.0.2.8 -e SONAR_ADDR=10.0.2.7 preetick/nginx-devops:v13
