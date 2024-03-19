FROM debian:bullseye


RUN apt-get update
RUN apt-get upgrade
RUN apt-get install mariadb-server -y

EXPOSE 3306

COPY ./tools/script.sh /
RUN chmod +x /script.sh

ENTRYPOINT ["./script.sh"]

CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
