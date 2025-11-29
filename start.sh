#!/bin/bash

echo "Starting Laravel application..."

echo "Running migrations..."
php artisan migrate --force

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Starting PHP-FPM..."
php-fpm &

echo "Starting Nginx..."
nginx -g 'daemon off;'