# Use a imagem oficial do PHP com Apache
FROM php:8.0-apache

# Instale extensões necessárias
RUN docker-php-ext-install pdo pdo_mysql

# Copie o código da aplicação para o diretório do Apache
COPY . /var/www/html/

# Defina o diretório de trabalho
WORKDIR /var/www/html/

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instale dependências do Composer
RUN composer install

# Exponha a porta 80
EXPOSE 80
