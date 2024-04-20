FROM php:fpm-alpine

RUN apk add --no-cache supervisor
RUN docker-php-ext-install mysqli pdo_mysql

# if use SQL Server install the following
# RUN wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.3.1-1_amd64.apk
# RUN wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk
# RUN apk add --allow-untrusted msodbcsql18_18.3.3.1-1_amd64.apk
# RUN apk add --allow-untrusted mssql-tools18_18.3.1.1-1_amd64.apk
# RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS unixodbc-dev
# RUN pecl install sqlsrv pdo_sqlsrv
# RUN docker-php-ext-enable sqlsrv pdo_sqlsrv
# RUN apk del .phpize-deps
# RUN rm msodbcsql18_18.3.3.1-1_amd64.apk
# RUN rm mssql-tools18_18.3.1.1-1_amd64.apk

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

COPY ./docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./docker/cron/crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN crontab /etc/cron.d/crontab

WORKDIR /var/www/html

CMD ["sh", "-c", "php -r \"file_exists('.env') || copy('.env.example', '.env');\"; composer install; php artisan key:generate; php artisan migrate; supervisord -c /etc/supervisor/conf.d/supervisord.conf"]