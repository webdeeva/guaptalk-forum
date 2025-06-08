#!/bin/bash

# Simple NodeBB Installation Script
set -e

echo "=== Simple NodeBB Installation ==="

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get server IP
SERVER_IP=$(curl -s http://checkip.amazonaws.com)
print_status "Server IP: $SERVER_IP"

# Check if MongoDB is running
if systemctl is-active --quiet mongod; then
    print_status "MongoDB is running"
else
    print_error "MongoDB is not running. Starting it..."
    systemctl start mongod
    systemctl enable mongod
fi

# Check if Redis is running
if systemctl is-active --quiet redis-server; then
    print_status "Redis is running"
else
    print_error "Redis is not running. Starting it..."
    systemctl start redis-server
    systemctl enable redis-server
fi

# Clean up and install NodeBB
cd /root
rm -rf nodebb
print_status "Cloning NodeBB..."
git clone -b v3.x https://github.com/NodeBB/NodeBB.git nodebb
cd nodebb

# Install dependencies
print_status "Installing dependencies..."
npm install --omit=dev

# Create config.json
print_status "Creating configuration..."
cat > config.json << EOF
{
    "url": "http://$SERVER_IP:4567",
    "secret": "$(openssl rand -hex 32)",
    "database": "mongo",
    "mongo": {
        "host": "127.0.0.1",
        "port": 27017,
        "database": "nodebb"
    },
    "port": 4567
}
EOF

# Setup database
print_status "Setting up database..."
./nodebb setup --skip-build <<EOF
http://$SERVER_IP:4567
$(openssl rand -hex 32)
mongo
127.0.0.1
27017


nodebb
admin
admin@example.com
adminpassword123
adminpassword123
EOF

# Build assets
print_status "Building NodeBB..."
./nodebb build

# Create systemd service
print_status "Creating systemd service..."
cat > /etc/systemd/system/nodebb.service << 'SERVICE'
[Unit]
Description=NodeBB
Documentation=https://docs.nodebb.org
After=system.slice multi-user.target mongod.service

[Service]
Type=simple
User=root
WorkingDirectory=/root/nodebb
ExecStart=/usr/bin/node loader.js
Restart=on-failure
RestartSec=5
StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=nodebb

[Install]
WantedBy=multi-user.target
SERVICE

# Start NodeBB
systemctl daemon-reload
systemctl enable nodebb
systemctl start nodebb

# Wait for NodeBB to start
print_status "Waiting for NodeBB to start..."
sleep 10

# Configure Nginx
print_status "Configuring Nginx..."
cat > /etc/nginx/sites-available/nodebb << NGINX
server {
    listen 80;
    server_name _;

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:4567;
        proxy_redirect off;

        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
NGINX

ln -sf /etc/nginx/sites-available/nodebb /etc/nginx/sites-enabled/
rm -f /etc/nginx/sites-enabled/default
nginx -t && systemctl restart nginx

# Final status check
print_status "Checking NodeBB status..."
if systemctl is-active --quiet nodebb; then
    echo -e "${GREEN}✓ NodeBB is running!${NC}"
    echo ""
    echo "=== Setup Complete ==="
    echo "Forum URL: http://$SERVER_IP"
    echo "Admin login: admin / adminpassword123"
    echo ""
    echo "IMPORTANT: Change the admin password immediately!"
    echo "Go to http://$SERVER_IP/admin"
else
    echo -e "${RED}✗ NodeBB failed to start${NC}"
    echo "Check logs with: journalctl -u nodebb -n 50"
fi