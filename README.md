# Server-web
Gerenciador de serviços httpd, mysqld_safe e mariadb

## Instalação
```
apt update -y
apt upgrade -y
apt install wget -y
wget https://raw.githubusercontent.com/Olliv3r/Server-web/main/server-web.sh
cp server-web.sh $PREFIX/bin/server-web
chmod +x $PREFIX/bin/server-web
server-web
[ -f server-web.sh ] && rm server-web.sh
echo -e "\e[32mGerencie o servidor web com este script\nAltere o script e troque o usuário oliver pelo seu\e[0m"
```

## Gerencie o servidor web

### Verifique o status:
```
server-web --status
```

### Iniciar:
```
server-web --start
```
### Encerrar:
```
server-webb--stop
```
