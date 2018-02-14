## <img src="https://s.w.org/about/images/logos/wordpress-logo-notext-rgb.png" alt=logo width="80" height="80" /> <img src="https://secure.gravatar.com/avatar/26da7b36ff8bb5db4211400358dc7c4e.jpg?s=512&r=g&d=mm" width="80" height="80" /> Wordpress + Docker
## Utilizando Wordpress baseado em containers com Docker... :whale:

Pressupôe-se que você já passui o Docker completamente instalado, bem como o docker-compose. Se você ainda não efetuou a instalação, consulte a documentação através do link:
https://docs.docker.com/

### Para utilizar

1. Para clonar o repositório, utilize o comando no bash:

```
git clone https://github.com/Gabriel2012Rissi/wordpress_site.git
```

2. Acesse o diretório criado.
3. Dê permissão para execução do script de deploy:
```
# chmod +x deploy.sh
```
4. Execute o script em bash através do comando:
```
$ ./deploy.sh
```
5. Crie um novo cluster com Docker swarm, baixe as imagens que serão utilizadas através do Docker Hub e execute a pilha de serviços do Wordpress:
```
docker swarm init --advertise-addr [public_ip]
docker pull wordpress:latest
docker pull mariadb:latest
docker stack deploy -c docker-compose.yml wp
```
6. Acesse o ip da máquina e configure o Wordpress.

```
http://[public_ip]/wp-admin/install.php
```
