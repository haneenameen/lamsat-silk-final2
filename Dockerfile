FROM php:8.2-apache

# تفعيل خاصية rewrite لمشاريع Laravel
RUN a2enmod rewrite

RUN docker-php-ext-install pdo pdo_mysql

COPY . /var/www/html/
WORKDIR /var/www/html

# تغيير مسار السيرفر ليعمل من داخل مجلد public مباشرة
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf

# إنشاء المجلدات الناقصة
RUN mkdir -p storage/framework/sessions \
    storage/framework/views \
    storage/framework/cache \
    bootstrap/cache

# إعطاء الصلاحيات
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 80
