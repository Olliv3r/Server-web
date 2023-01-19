# Server-web
Gerenciador de serviços mysqld_safe e apachectl

## Instalação
```
apt update -y
apt upgrade -y
apt install wget -y
wget https://raw.githubusercontent.com/Olliv3r/Server-web/main/server.sh
cp server.sh $PREFIX/bin/server
chmod +x $PREFIX/bin/server
server
[ -f server.sh ] && rm server.sh
echo -e "\e[32mGerencie o servidor web com este script\nAltere o script e troque o usuário oliver pelo seu\n\e[0m"
```

## Gerencie o servidor web
### Iniciar:
```
server -start
```
### Encerrar:
```
server -stop
```
