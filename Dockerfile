# Use a imagem oficial do PHP com Apache
FROM php:8.0-apache

# Instale dependências do sistema e extensões PHP necessárias
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && docker-php-ext-install pdo pdo_mysql

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Defina o diretório de trabalho
WORKDIR /var/www/html/

# Copie o arquivo composer.json para o diretório de trabalho
COPY composer.json ./

# Instale dependências do Composer
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist --verbose

# Copie o restante do código da aplicação para o diretório do Apache
COPY . .

# Ajuste permissões
RUN chown -R www-data:www-data /var/www/html

# Exponha a porta 80
EXPOSE 80

# Comando para iniciar o Apache
CMD ["apache2-foreground"]

# Copie o arquivo de configuração do Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
