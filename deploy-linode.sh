#!/bin/bash
# Guaptalk Forum Deployment Script for Linode/VPS

echo "=== Guaptalk Forum Deployment Script ==="
echo "This script will set up NodeBB with Docker on your VPS"
echo ""

# Update system
echo "1. Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install Docker
echo "2. Installing Docker..."
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# Install Docker Compose
echo "3. Installing Docker Compose..."
sudo apt install docker-compose -y

# Clone repository
echo "4. Cloning Guaptalk forum..."
git clone https://github.com/webdeeva/guaptalk-forum.git
cd guaptalk-forum/forum

# Create Docker directories
echo "5. Creating Docker directories..."
mkdir -p .docker/database/redis
mkdir -p .docker/database/mongo/data
mkdir -p .docker/build
mkdir -p .docker/public/uploads
mkdir -p .docker/config

# Create production config
echo "6. Creating production configuration..."
cat > config.json << 'EOF'
{
    "url": "http://YOURDOMAIN.COM",
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

# Restore original Dockerfile
if [ -f "Dockerfile.backup" ]; then
    mv Dockerfile.backup Dockerfile
fi

# Start services
echo "7. Starting services with Docker Compose..."
docker-compose -f docker-compose-redis.yml up -d

echo ""
echo "=== Setup Complete! ==="
echo ""
echo "Next steps:"
echo "1. Edit config.json and change YOURDOMAIN.COM to your actual domain"
echo "2. Set up Nginx reverse proxy (see nginx-setup.sh)"
echo "3. Configure SSL with Let's Encrypt"
echo "4. Access your forum at http://YOUR-IP:4567"
echo ""
echo "To check logs: docker-compose logs -f"
echo "To restart: docker-compose restart"