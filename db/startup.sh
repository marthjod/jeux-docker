#!/bin/bash

/usr/bin/mysqld_safe &
sleep 3
mysql -e "CREATE DATABASE jeuxdb;"
mysql -e "CREATE USER 'jeuxdb_user'@'localhost' IDENTIFIED BY '1234';"
# CREATE, ALTER for django
mysql -e 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX ON `jeuxdb`.* TO `jeuxdb_user`@`localhost`;'
mysql jeuxdb < /tmp/jeuxdb.sql

killall mysqld
sleep 3

/usr/bin/mysqld_safe
