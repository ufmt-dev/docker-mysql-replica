ALTER USER 'replicador'@'%' IDENTIFIED WITH 'mysql_native_password' BY 'replicador';
GRANT REPLICATION SLAVE ON *.* TO 'replicador'@'%';
FLUSH PRIVILEGES;