#syntax=docker/dockerfile:1
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD: rafraf.123
RUN docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
RUN docker cp .\initdb.sql bdMysql:/
RUN docker cp .\database_and_grant.sql bdMysql:/
RUN docker exec -it bdMysql mysql -u root -prafraf.123 cat initdb.sql | mysql -u root -prafraf.123 guacamole_db