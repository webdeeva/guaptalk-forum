#!/bin/bash
# Complete Docker Fix Script

echo "=== Complete Docker Reset for NodeBB ==="
echo ""

# Stop everything
echo "1. Stopping all containers..."
docker-compose down
docker-compose -f docker-compose-simple.yml down 2>/dev/null || true

# Remove ALL old volumes
echo "2. Removing old Docker volumes..."
docker volume ls | grep guaptalk-forum | awk '{print $2}' | xargs -r docker volume rm -f

# Clean up old containers
echo "3. Cleaning up old containers..."
docker ps -a | grep guaptalk-forum | awk '{print $1}' | xargs -r docker rm -f

# Create fresh directories
echo "4. Creating fresh directories..."
sudo rm -rf .docker
mkdir -p .docker/database/redis
mkdir -p .docker/build
mkdir -p .docker/public/uploads
sudo chown -R 1001:1001 .docker/
sudo chmod -R 755 .docker/

# Ensure config exists
echo "5. Creating config.json..."
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

# Create simple docker-compose
echo "6. Creating docker-compose-simple.yml..."
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
    command: ['redis-server', '--appendonly', 'yes']
    volumes:
      - redis-data:/data

volumes:
  redis-data:
  nodebb-build:
  nodebb-uploads:
EOF

# Start fresh
echo "7. Starting fresh containers..."
docker-compose -f docker-compose-simple.yml up -d --build

# Wait for initialization
echo "8. Waiting for services to start..."
sleep 10

# Check status
echo "9. Container status:"
docker-compose -f docker-compose-simple.yml ps

echo ""
echo "=== Complete! ==="
echo ""
echo "NodeBB should be accessible at:"
echo "  - http://50.116.43.31:4567"
echo "  - https://guaptalk.xyz (after SSL setup)"
echo ""
echo "Monitor logs: docker-compose -f docker-compose-simple.yml logs -f"
echo ""

# Show initial logs
docker-compose -f docker-compose-simple.yml logs --tail=50