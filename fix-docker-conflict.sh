#!/bin/bash

echo "=== Fixing Docker package conflict ==="

# Remove conflicting packages
echo "Removing conflicting packages..."
apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true
apt autoremove -y

# Clean up
apt clean
rm -rf /var/lib/docker

# Install Docker from official repository
echo "Installing Docker from official repository..."
apt update
apt install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start Docker
systemctl start docker
systemctl enable docker

# Create docker-compose alias
ln -sf /usr/libexec/docker/cli-plugins/docker-compose /usr/local/bin/docker-compose 2>/dev/null || true

# Verify installation
echo ""
echo "Docker version:"
docker --version

echo ""
echo "Docker Compose version:"
docker compose version

echo ""
echo "=== Docker conflict resolved ==="
echo "You can now run the fresh setup script."