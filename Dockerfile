FROM nginx:latest

RUN apt-get update
RUN apt-get install netcat -y

ADD https://dl.eff.org/certbot-auto /usr/local/bin/certbot-auto
RUN chown root /usr/local/bin/certbot-auto && \
    chmod 0755 /usr/local/bin/certbot-auto && \
    certbot-auto -n --install-only

RUN rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/*

COPY nginx.conf /etc/nginx

RUN mkdir -p /etc/nginx/logs 

