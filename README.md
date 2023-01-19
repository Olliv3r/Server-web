# Server-web
Gerenciador de serviços mysqld_safe e apachectl

## Instalação
```
apt update -y
apt upgrade -y
apt install wget -y
wget LINK
cp server.sh $PREFIX/bin/server
chmod +x $PREFIX/bin/server
server
echo -e "Gerencie o servidor web com este script\nAltere o script ao seu gosto\n\e[0m"
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
