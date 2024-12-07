#!/bin/sh

until mysqladmin ping -h localhost -u root -p"$MYSQL_ROOT_PASSWORD" &> /dev/null; do
    echo "Waiting for database connection..."
    sleep 2
done

mysql -u root -p"$MYSQL_ROOT_PASSWORD" << MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "Database is ready!"