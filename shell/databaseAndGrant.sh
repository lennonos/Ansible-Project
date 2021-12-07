#Exec script into mysql
docker exec -i bdMysql  mysql -u root -prafraf.123 < database_and_grant.sql
#Generate database structure
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
#Exec script into mysql
docker exec -i bdMysql  mysql -u root -prafraf.123 guacamole_db < initdb.sql