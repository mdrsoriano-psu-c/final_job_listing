FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    sqlite3 \
    libsqlite3-dev \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-install \
    pdo \
    pdo_sqlite \
    zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Create SQLite database
RUN mkdir -p database && touch database/database.sqlite

# Install dependencies
RUN composer install --ignore-platform-reqs --no-dev --optimize-autoloader

# Fix permissions
RUN chmod -R 777 storage bootstrap/cache database

# Generate Laravel key
RUN php artisan key:generate --force

# Cache config
RUN php artisan config:cache || true

# Expose Render port
EXPOSE 10000

# Start Laravel
CMD php artisan serve --host=0.0.0.0 --port=10000