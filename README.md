# Lista de shel scripts para download
### Apos criar o CONTAINER acessar via SSH
`` docker exec -it $NOME_CONTAINER /bin/bash ``
### Atualizar sistema
`` apt update && apt install git nano wget -y ``
### Baixar script
``wget https://raw.githubusercontent.com/thiagoguto/sh/master/docker-drupal-up-instal.sh && ./docker-drupal-up-instal.sh``
