FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TZ 'Europe/Minsk'

RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

RUN apt-get update && \
    apt-get install -y apache2 \
      software-properties-common

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php && \
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php5-compat

RUN apt-get update && \
    apt-get install -y libapache2-mod-fastcgi php5.6-fpm php5.6-mysql php5.6-mbstring php5.6-gd php5.6-xml php5.6-memcached memcached

COPY php5-fpm.conf /etc/apache2/conf-available/php5-fpm.conf

ENV APACHE_RUN_USER www-data 
ENV APACHE_RUN_GROUP www-data 
ENV APACHE_LOG_DIR /var/log/apache2 

RUN a2enmod actions fastcgi alias && \
    a2enconf php5-fpm


RUN apt-get install -y supervisor 

COPY apache2.conf /etc/supervisor/conf.d/apache2.conf
COPY memcached.conf /etc/supervisor/conf.d/memcached.conf
COPY php5.6-fpm.conf /etc/supervisor/conf.d/php5.6-fpm.conf
RUN rm /etc/php/5.6/fpm/php.ini
COPY php.ini /etc/php/5.6/fpm/php.ini

RUN rm -rf /var/www
COPY www /var/www

RUN chmod 777 /var/www/html/sites/default/settings.php

COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN /start.sh

EXPOSE 80

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisor/supervisord.conf"]
