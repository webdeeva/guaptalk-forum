#!/bin/bash
# Fresh Start with New Project Name

echo "=== Fresh NodeBB Deployment ==="
echo ""

# Stop any existing containers
docker-compose down 2>/dev/null || true
docker-compose -f docker-compose-simple.yml down 2>/dev/null || true

# Create new docker-compose with different project name
cat > docker-compose-prod.yml << 'EOF'
version: '3.8'

services:
  app:
    build: .
    container_name: guaptalk_app
    restart: unless-stopped
    ports:
      - '4567:4567'
    volumes:
      - ./config.json:/usr/src/app/config.json:ro
      - app_build:/usr/src/app/build
      - app_uploads:/usr/src/app/public/uploads
    depends_on:
      - db
    environment:
      - NODE_ENV=production

  db:
    image: redis:7-alpine
    container_name: guaptalk_redis
    restart: unless-stopped
    command: ['redis-server', '--appendonly', 'yes']
    volumes:
      - db_data:/data

volumes:
  db_data:
  app_build:
  app_uploads:
EOF

# Update config to use new service names
cat > config.json << 'EOF'
{
    "url": "https://guaptalk.xyz",
    "secret": "kEVS950v/PKx0X8yelKhfAPWASxM18flVSnDy80tF58=",
    "database": "redis",
    "port": "4567",
    "redis": {
        "host": "db",
        "port": 6379,
        "password": "",
        "database": 0
    }
}
EOF

# Start with new project name
echo "Starting fresh deployment..."
docker-compose -p guaptalk -f docker-compose-prod.yml up -d --build

# Wait for startup
echo "Waiting for services..."
sleep 10

# Check status
docker ps

echo ""
echo "=== Deployment Complete! ==="
echo "Access at: http://50.116.43.31:4567"
echo "Logs: docker-compose -p guaptalk -f docker-compose-prod.yml logs -f"