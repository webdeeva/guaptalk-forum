#!/bin/bash

# Guaptalk Forum Setup with Environment Variables
# This script sets up NodeBB with predefined values

export NODEBB_URL="http://localhost:4567"
export NODEBB_PORT="4567"
export NODEBB_ADMIN_USERNAME="admin"
export NODEBB_ADMIN_PASSWORD="changeme123!"
export NODEBB_ADMIN_PASSWORD_CONFIRM="changeme123!"
export NODEBB_ADMIN_EMAIL="admin@guaptalk.com"
export NODEBB_DATABASE="redis"

echo "Setting up Guaptalk Forum with these settings:"
echo "URL: $NODEBB_URL"
echo "Port: $NODEBB_PORT"
echo "Admin Username: $NODEBB_ADMIN_USERNAME"
echo "Admin Email: $NODEBB_ADMIN_EMAIL"
echo "Database: $NODEBB_DATABASE"
echo ""
echo "IMPORTANT: Change the admin password after first login!"
echo ""

./nodebb setup