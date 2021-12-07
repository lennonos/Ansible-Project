CREATE DATABASE guacamole_db;
CREATE USER 'guacamole_user'@'localhost' IDENTIFIED BY 'rafraf.123';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole_user'@'localhost';
CREATE USER 'guacamole_user'@'172.19.0.4' IDENTIFIED BY 'rafraf.123';
GRANT SELECT,INSERT,UPDATE,DELETE ON guacamole_db.* TO 'guacamole_user'@'172.19.0.4';
FLUSH PRIVILEGES;
EXIT;