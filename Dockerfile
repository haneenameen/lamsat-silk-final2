FROM php:8.2-apache

# تثبيت الإضافات المطلوبة للارافل

# تفعيل rewrite
RUN a2enmod rewrite


# نسخ المشروع
COPY . /var/www/html/
WORKDIR  /var/www/html/
RUN mkdir -p public app bootstrap
confige database resources route
stroage
 
# إعطاء الصلاحيات
RUN chowd -R 777 /var/www/html/




EXPOSE 80









