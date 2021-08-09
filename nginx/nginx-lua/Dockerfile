FROM ubuntu
COPY ./exts/* /tmp/
WORKDIR /tmp
RUN /tmp/install.sh
# CMD [ "/usr/local/nginx/sbin/nginx", "-c", "/usr/local/nginx/conf/nginx.conf", "-p", "/usr/local/nginx/","-g", "daemon" ]
EXPOSE 80 443