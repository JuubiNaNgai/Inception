#!/bin/sh


/etc/init.d/mariadb start

mysql_secure_installation << EOF
$SQL_ROOT_PASSWORD
Y
n
Y
n
Y
Y
EOF

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

/etc/init.d/mariadb stop

exec "$@"


