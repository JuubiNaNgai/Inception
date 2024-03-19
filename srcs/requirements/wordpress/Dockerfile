FROM debian:bullseye


RUN apt update -y 

RUN apt install php-fpm php-mysql -y

RUN apt install curl -y

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /

RUN chmod +x /script.sh
CMD [ "/script.sh" ]
