#!/bin/bash
# Fix Docker Permissions and Restart NodeBB

echo "=== Fixing Docker Permissions for NodeBB ==="
echo ""

# Stop all containers
echo "1. Stopping containers..."
docker-compose down

# Fix permissions
echo "2. Fixing Docker directory permissions..."
sudo chown -R 1001:1001 .docker/
sudo chmod -R 755 .docker/

# Remove and recreate config directory
echo "3. Recreating config directory..."
sudo rm -rf .docker/config
mkdir -p .docker/config
sudo chown 1001:1001 .docker/config

# Create simplified docker-compose
echo "4. Creating simplified docker-compose configuration..."
cat > docker-compose-simple.yml << 'EOF'
version: '3.8'

services:
  nodebb:
    build: .
    restart: unless-stopped
    ports:
      - '4567:4567'
    volumes:
      - ./config.json:/usr/src/app/config.json:ro
      - nodebb-build:/usr/src/app/build
      - nodebb-uploads:/usr/src/app/public/uploads
    depends_on:
      - redis
    environment:
      - NODE_ENV=production

  redis:
    image: redis:7-alpine
    restart: unless-stopped
    volumes:
      - redis-data:/data

volumes:
  redis-data:
  nodebb-build:
  nodebb-uploads:
EOF

# Make sure config.json exists and has correct content
echo "5. Verifying config.json..."
if [ ! -f config.json ]; then
    echo "Creating config.json..."
    cat > config.json << 'EOF'
{
    "url": "https://guaptalk.xyz",
    "secret": "kEVS950v/PKx0X8yelKhfAPWASxM18flVSnDy80tF58=",
    "database": "redis",
    "port": "4567",
    "redis": {
        "host": "redis",
        "port": 6379,
        "password": "",
        "database": 0
    }
}
EOF
fi

# Start with new configuration
echo "6. Starting NodeBB with simplified configuration..."
docker-compose -f docker-compose-simple.yml up -d

# Wait a moment for containers to start
echo "7. Waiting for containers to initialize..."
sleep 5

# Show status
echo "8. Checking container status..."
docker-compose -f docker-compose-simple.yml ps

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "Check logs with: docker-compose -f docker-compose-simple.yml logs -f"
echo "Access forum at: http://$(curl -s ifconfig.me):4567"
echo "Or at: https://guaptalk.xyz (once SSL is configured)"
echo ""

# Show logs
echo "Showing NodeBB logs (Ctrl+C to exit)..."
docker-compose -f docker-compose-simple.yml logs -f nodebb