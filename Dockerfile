FROM mysql:8.1

ENV MYSQL_ROOT_PASSWORD=faeng
COPY ./iniciar.sql /docker-entrypoint-initdb.d
EXPOSE 3306