FROM php:8.2-apache

# تثبيت الإضافات المطلوبة للارافل
RUN docker-php-ext-install pdo pdo_mysql

# تفعيل rewrite
RUN a2enmod rewrite

# السماح باستخدام .htaccess
RUN sed -i '/<Directory \/var\/www\/>/,/AllowOverride/s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# نسخ المشروع
COPY . /var/www/html/

WORKDIR /var/www/html

# إنشاء مجلدات Laravel الناقصة
RUN mkdir -p storage/framework/sessions \
    storage/framework/views \
    storage/framework/cache \
    bootstrap/cache

# إعطاء الصلاحيات
RUN chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

EXPOSE 80

CMD ["apache2-foreground"]

