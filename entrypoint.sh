#!/bin/bash
set -e

# Wait for the database to be ready
echo "Waiting for database..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "Database started"

# Run database migrations
echo "Running database migrations..."
bundle exec rails db:migrate db:seed

# Start the Rails server
echo "Starting Rails server..."
exec bundle exec "$@"