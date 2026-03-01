FROM php:8.2-apache

# تثبيت الإضافات المطلوبة للارافل

# تفعيل rewrite
RUN a2enmod rewrite
RUN docker-php-ext-install pdo
pdo_mysql

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



