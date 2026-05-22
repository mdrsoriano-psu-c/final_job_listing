FROM php:8.2-cli

# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    sqlite3 \
    libsqlite3-dev

# Install SQLite PHP extension
RUN docker-php-ext-install pdo pdo_sqlite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set app directory
WORKDIR /app

# Copy project
COPY . .

# Create SQLite database
RUN touch database/database.sqlite

# Install Composer dependencies safely
RUN composer install --ignore-platform-reqs

# Permissions
RUN chmod -R 777 storage bootstrap/cache database

# Generate Laravel key
RUN php artisan key:generate --force || true

# Expose Render port
EXPOSE 10000

# Start Laravel
CMD php artisan serve --host=0.0.0.0 --port=10000