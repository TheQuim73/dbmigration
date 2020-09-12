#!/bin/bash


##Install mysql first 
apt-get remove --purge mysql* -y
apt-get purge mysql* -y
apt-get autoremove -y
apt-get autoclean -y
apt-get remove dbconfig-mysql -y
apt-get install mysql-server -y
echo ErrorCode: $?

if [ $? -gt 0 ]
then
	echo Something went wrong with mysql install.
	exit 1
else
	# comment out bind_address = 127.0.0.1 in  /etc/mysql/mysql.conf.d/mysqld.cnf to ensure remote connections can occur for demo purposes.
	sed -i 's/bind-address/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
	if [  $? -gt 0 ]
	then
		echo Something went wrong with mysqld.cnf overwrite.
		exit 1
	else
	echo CNF file adjusted for remote connections.
		# execute sql script to build DB and associated tables
		mysql -u root -p < $1 
	fi
fi


#Restart mysql for remote connections to take effect
systemctl restart mysql