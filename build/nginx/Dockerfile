FROM ubuntu:14.04
MAINTAINER Oliver Lundquist "mail@oliverlundquist.com"

RUN \
  apt-get update     -y && \
  apt-get install    -y software-properties-common && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update     -y && \
  apt-get install    -y nginx=1.10.0-0+trusty0

WORKDIR /etc/nginx

COPY assets/nginx.conf   nginx.conf
COPY assets/default      sites-available/default
COPY assets/letsencrypt  sites-available/letsencrypt

RUN \
  ln -sf /dev/stdout                            /var/log/nginx/access.log && \
  ln -sf /dev/stderr                            /var/log/nginx/error.log && \
  ln -sf /etc/nginx/sites-available/letsencrypt /etc/nginx/sites-enabled/letsencrypt

CMD ["nginx"]
