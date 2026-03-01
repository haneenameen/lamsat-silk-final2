FROM php:8.2-apache

# تثبيت الإضافات المطلوبة للارافل

# تفعيل rewrite
RUN a2enmod rewrite
RUN docker-php-ext-install pdo
pdo_mysql

# نسخ المشروع
COPY . /var/www/html/

 ENV APACHE_DOCUMENT_ROOT /var/www/
 html/public
 RUN sed -ri -e 's!/var/www/html!
 ${APACHE_DOCUMENT_ROOT}!g' /etc/
 apache2/sites-available/*.conf
 RUN sed -ri -e 's!/var/www/html!
 ${APACHE_DOCUMENT_ROOT}!g' /etc/
 apache2/apache2-conf/etc/apache2/
 conf-available/*.conf

# إعطاء الصلاحيات
RUN chowd -R 777 /var/www/html/
storage /var/www/html/bootstrap/cache
WORKDIR /var/www/html


EXPOSE 80








