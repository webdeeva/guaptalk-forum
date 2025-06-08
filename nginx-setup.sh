#!/bin/bash
# Nginx Setup Script for Guaptalk Forum

echo "=== Nginx Setup for Guaptalk Forum ==="
echo ""

# Install Nginx
echo "1. Installing Nginx..."
sudo apt install nginx certbot python3-certbot-nginx -y

# Get domain name
read -p "Enter your domain name (e.g., forum.guaptalk.com): " DOMAIN

# Create Nginx config
echo "2. Creating Nginx configuration..."
sudo tee /etc/nginx/sites-available/guaptalk << EOF
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header Host \$http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:4567;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
EOF

# Enable site
echo "3. Enabling site..."
sudo ln -sf /etc/nginx/sites-available/guaptalk /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl reload nginx

# Update NodeBB config
echo "4. Updating NodeBB configuration..."
cd ~/guaptalk-forum/forum
sed -i "s|http://YOURDOMAIN.COM|https://$DOMAIN|g" config.json

# Restart NodeBB
echo "5. Restarting NodeBB..."
docker-compose restart

# SSL Certificate
echo ""
echo "6. Setting up SSL certificate..."
sudo certbot --nginx -d $DOMAIN

echo ""
echo "=== Setup Complete! ==="
echo "Your forum should now be accessible at: https://$DOMAIN"
echo ""
echo "Remember to:"
echo "1. Update DNS to point $DOMAIN to this server's IP"
echo "2. Open ports 80 and 443 in your firewall"