#!/bin/bash
set -e

# Wait for the database to be ready
echo "Waiting for database..."
while ! nc -z db 5432; do
  sleep 0.1
done
echo "Database started"

# Reset and setup the database
echo "Resetting and setting up the database..."
bundle exec rails db:reset db:setup

# Check if migrations are needed
if bundle exec rails db:version | grep -q "database is not yet setup"; then
  echo "Running database migrations..."
  bundle exec rails db:migrate
else
  echo "Database migrations are up to date."
fi

# Check if seeding is needed
# The db:setup command already loads the seeds, so this might not be necessary.
# If you want to run seeds separately (for example, in a production environment),
# you might want to keep this check.
if ! bundle exec rails runner 'exit LegalCase.exists?' 2>/dev/null; then
  echo "Seeding database..."
  bundle exec rails db:seed
else
  echo "Database is already seeded."
fi

# Start the Rails server
echo "Starting Rails server..."
exec bundle exec "$@"
