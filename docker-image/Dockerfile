FROM ubuntu:22.04

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y nginx

COPY nginx.config /etc/nginx/sites-available/default

COPY index.html /var/www/html/
 
EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]

