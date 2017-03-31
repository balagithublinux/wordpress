#!/bin/bash

mysql -u root  <<MYSQL_SCRIPT
CREATE USER wordpress@localhost IDENTIFIED BY "wordpress";
create database wordpress;
GRANT ALL ON wordpress.* TO wordpress@localhost;
FLUSH PRIVILEGES;
MYSQL_SCRIPT
