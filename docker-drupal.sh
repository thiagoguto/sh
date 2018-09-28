#!/bin/bash
echo "Nome do Container"
read NOME
echo "Porta"
read PORTA
echo "Servidor MYSQL"
read MYSQL
echo "Versao do drupal (:8.6.1)"
read VERSAO
docker run --name $NOME -p $PORTA:80 \
--link $MYSQL:mysql \
-v /Users/admin/Dev/drupal/temas/$NOME:/var/www/html/themes/custom \
-d drupal$VERSAO
echo "acessando container"
docker exec -it $NOME /bin/bash
