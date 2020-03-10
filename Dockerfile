FROM nginx:latest

RUN apt-get update
RUN apt-get install bash -y
RUN apt-get install netcat -y
RUN apt-get install iputils-ping -y
RUN apt-get install vi -y

#ADD https://dl.eff.org/certbot-auto /usr/local/bin/certbot-auto
#RUN chown root /usr/local/bin/certbot-auto && \
#    chmod 0755 /usr/local/bin/certbot-auto && \
#    certbot-auto -n --install-only

RUN rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*

COPY nginx.conf /etc/nginx
COPY 50x.html /etc/nginx/html/
COPY fsdemo-gateway.fsdemo.com.cert.pem /etc/nginx
COPY fsdemo-gateway.fsdemo.com.key.pem /etc/nginx

#RUN mkdir -p /etc/nginx/logs 

