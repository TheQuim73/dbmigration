#!/bin/bash
##Install mysql first
sudo -i

apt-get install mysql-server -y

if [ $? -eq 0 ]
then
	echo Something went wrong with mysql install.
	exit 1
else

	# comment out bind_address = 127.0.0.1 in  /etc/mysql/mysql.conf.d/mysqld.cnf to ensure remote connections can occur for demo purposes.
	sed -i 's/bind-address/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
	if [  $? -eq 0 ]
	then
		echo Something went wrong with mysqld.cnf overwrite.
		exit 1
	fi
fi



