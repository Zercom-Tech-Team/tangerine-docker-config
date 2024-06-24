FROM php:8.1-apache

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    gnupg2 \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libldap2-dev \
    unixodbc-dev \
    freetds-dev \
    libssl-dev \
    libonig-dev \
    odbcinst1debian2 \
    odbcinst \
    && apt-get clean

# Install the required php extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install -j$(nproc) mbstring

RUN docker-php-ext-install -j$(nproc) pdo

RUN docker-php-ext-install -j$(nproc) ldap

RUN docker-php-ext-install -j$(nproc) pdo_mysql

RUN apt-get update && apt-get install -y unixodbc-dev \
    && docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr \
    && docker-php-ext-install -j$(nproc) pdo_odbc

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17 \
    && apt-get clean

RUN pecl install sqlsrv pdo_sqlsrv \
    && docker-php-ext-enable sqlsrv pdo_sqlsrv

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
