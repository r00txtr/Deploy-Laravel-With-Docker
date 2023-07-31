# Use the official PHP image as the base image
FROM php:7.2-fpm

# Set the working directory inside the container
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip git nano \
    unzip

# Install PHP extensions required by Laravel
RUN docker-php-ext-install gd pdo pdo_mysql mysqli

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the Laravel files to the container's working directory
COPY . .

# Run necessary commands to set up the Laravel project
RUN composer update
RUN composer install
RUN cp .env.example .env
RUN php artisan key:generate

# Expose port 8000 for the Laravel application
EXPOSE 8000

# Start the PHP-FPM server to run the Laravel application
CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
