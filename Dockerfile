FROM docker.io/openshift/base-centos7:latest

RUN yum makecache
RUN yum -y install php-fpm php php-gd php-mysql php-mbstring php-xml php-mcrypt  php-imap php-odbc php-pear php-xmlrpc  
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php-fpm.d/www.conf
RUN sed -i 's/listen.allowed_clients = 127.0.0.1/;listen.allowed_clients = 127.0.0.1/' /etc/php-fpm.d/www.conf

EXPOSE 9000
CMD ["/sbin/php-fpm"]
