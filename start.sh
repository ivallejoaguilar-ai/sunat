#!/bin/bash

echo "Starting Laravel application..."

# Set default PORT if not set
if [ -z "$PORT" ]; then
    PORT=8080
    echo "PORT not set, using default: $PORT"
fi

echo "Running migrations..."
php artisan migrate --force

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Starting server on port $PORT..."
php artisan serve --host=0.0.0.0 --port=$PORT