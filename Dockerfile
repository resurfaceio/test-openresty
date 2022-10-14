FROM openresty/openresty:1.21.4.1-centos
RUN yum update -y && yum install -y git gcc
COPY ./resurface.conf /etc/nginx/conf.d/resurface.conf
RUN luarocks install resurfaceio-logger