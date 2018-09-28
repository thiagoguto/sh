#!/bin/bash
echo "Instalando Composer"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer
echo "Instalando Drupal Console"
curl https://drupalconsole.com/installer -L -o drupal.phar && mv drupal.phar /usr/local/bin/drupal && chmod +x /usr/local/bin/drupal && composer require drupal/console:~1.0 --prefer-dist --optimize-autoloader && cp sites/default/default.settings.php  sites/default/settings.php
echo "Instalando Drupal..."
echo "Nome do Servidor"
read MYSQL
echo "Nome Banco de dados"
read DB_NAME
echo "Usuario Banco de dados"
read DB_USER
echo "Senha Banco de dados"
read PASS
echo "Nome site Drupal"
read NOME_SITE
echo "Usuario Drupal"
read ADMIN
echo "Email Drupal"
read EMAIL
echo "Senha Drupal"
read SENHA
drupal site:install  standard --langcode="pt-br" --db-type="mysql" --db-host="$MYSQL"  --db-name="$DB_NAME" --db-user="$DB_USER" --db-pass="$PASS" --db-port="3306"  --site-name="$NOME_SITE" --site-mail="$EMAIL"  --account-name="$ADMIN" --account-mail="$EMAIL" --account-pass="$SENHA" --no-interaction && chmod -R 777 sites/default/files && drupal site:mode dev
echo "Instalando modulos"
composer require webonyx/graphql-php && drupal mod admin_toolbar pathauto graphql_twig devel components paragraphs geolocation
echo "Habilitando Módulos"
drupal moi graphql_twig graphql_core pathauto components kint paragraphs geolocation media admin_toolbar_tools

