# Lista de shel scripts para download
### Acessar CONTAINER via SSH
`` docker exec -it $NOME_CONTAINER /bin/bash ``
### Atualizar CONTAINER
`` apt update && apt install git nano wget -y ``
### Baixar script
``wget https://raw.githubusercontent.com/thiagoguto/sh/master/docker-drupal-up-instal.sh``
### Executar script
``chmod +x ./docker-drupal-up-instal.sh``
