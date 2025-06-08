#!/bin/bash
# NodeBB Setup Script for Guaptalk

echo "=== Setting up Guaptalk Forum ==="

# Set environment variables for automated setup
export NODEBB_INIT_SETUP=true
export NODEBB_URL="http://50.116.43.31:4567"
export NODEBB_DATABASE="redis"
export NODEBB_REDIS_HOST="guaptalk_redis"
export NODEBB_REDIS_PORT="6379"
export NODEBB_REDIS_DATABASE="0"
export NODEBB_ADMIN_USERNAME="admin"
export NODEBB_ADMIN_EMAIL="gurldeeva@gmail.com"
export NODEBB_ADMIN_PASSWORD="Olokun2026!"

# Run setup
echo "Running NodeBB setup..."
./nodebb setup --skip-build

# Build assets
echo "Building assets..."
./nodebb build

echo "Setup complete! Forum should be accessible at http://50.116.43.31:4567"