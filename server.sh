#!/usr/bin/env bash
# server.sh
#
# Github	: https://github.com/Olliv3r
#
# Por oliver, 17 de janeiro 2023
#

apache=$(ps -e | grep -o "httpd")
mysqld_safe=$(ps -e | grep -o "mysqld_safe")
mariadb=$(ps -e | grep -o "mariadbd")

apache() {
    apachectl -k "$1"
}
mysql_start() {
    mysqld_safe -u oliver > /dev/null 3>&2 &
}

mysql_stop() {
    pkill mariadb > /dev/null 3>&2
}

start() {
    if [ -n "$apache" -a -n "$mysqld_safe" -a -n "$mariadb" ] ; then
	echo "Servidor Web ja está rodando!"
	exit 1

    fi

    if [ -n "$apache" -a -z "$mysqld_safe" -a -z "$mariadb" ] ; then
	printf "\rReiniciando Apache..."
	apache "restart"
	printf "\rReiniciando Apache...OK\n"
	printf "\rIniciando MySQLd..."
	mysql_start
	printf "\rIniciando MySQLd...OK\n"
	exit 0
    fi

    if [ -z "$apache" -a -n "$mysqld_safe" -a -n "$mariadb" ] ; then
	printf "\rIniciando Apache..."
	apache "start"
	printf "\rIniciando Apache...OK\n"
	mysql_stop > /dev/null 3>&2
	printf "\rReiniciando MySQLd..."
	mysql_start
	printf "\rReiniciando MySQLd...OK\n"
	exit 0
    fi

    if [ -z "$apache" -a -z "$mysqld_safe" -a -z "$mariadb" ] ; then
        printf "\rServidor Web Iniciando..."
        apache "start"
        mysql_start
        printf "\rServidor Web Iniciando...OK\n"
	exit 0
    fi
}

stop() {
    if [ -n "$apache" -a -n "$mysqld_safe" -a -n "$mariadb" ] ; then
	printf "\rServidor Web encerrando..."
	apache "stop"
	mysql_stop
	printf "\rServidor Web encerrando...OK\n"
	exit 0
    fi

    if [ -n "$apache" -a -z "$mysqld_safe" -a -z "$mariadb" ] ; then
	printf "\rMysqld ja está encerrado!\n"
	printf "\rApache encerrando..."
	apache "stop"
	printf "\rApache encerrando...OK\n"
	exit 0
    fi

    if [ -z "$apache" -a -n "$mysqld_safe" -a -n "$mariadb" ] ; then
	printf "\rApache ja está encerrado!\n"
	printf "\rMySQLd encerrando..."
	mysql_stop
	printf "\rMySQLd encerrando...OK\n"
    fi

    if [ -z "$apache" -a -z "$mysqld_safe" -a -z "$mariadb" ] ; then
	echo "Servidor Web ja está parado!"
	exit 1
    fi
}
 
if [ -n "$1" -a "$1" == "-start" ] ; then
    start

elif [ -n "$1" -a "$1" == "-stop" ] ; then
    stop

else
    echo "Usage: $(basename "$0") -start | -stop"
    exit 1
fi
