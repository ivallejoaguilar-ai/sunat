#!/bin/sh

echo "Starting Laravel application..."

echo "Running migrations..."
php artisan migrate --force

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Testing Nginx config..."
nginx -t

echo "Starting PHP-FPM..."
php-fpm &

echo "Waiting for PHP-FPM..."
sleep 2

echo "Starting Nginx..."
nginx -g 'daemon off;'