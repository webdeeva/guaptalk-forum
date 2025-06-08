#!/bin/bash
# Fix NodeBB Config Location

echo "=== Fixing NodeBB Config Location ==="
echo ""

# Copy config to the location NodeBB expects
echo "1. Creating /opt/config directory in container..."
docker-compose -p guaptalk -f docker-compose-prod.yml exec app bash -c 'mkdir -p /opt/config && cp /usr/src/app/config.json /opt/config/config.json && ls -la /opt/config/'

# Restart the app container
echo ""
echo "2. Restarting NodeBB container..."
docker-compose -p guaptalk -f docker-compose-prod.yml restart app

# Wait for restart
echo ""
echo "3. Waiting for NodeBB to start..."
sleep 10

# Check logs
echo ""
echo "4. Checking NodeBB logs..."
docker-compose -p guaptalk -f docker-compose-prod.yml logs --tail=30 app

echo ""
echo "=== Fix Complete! ==="
echo "Access forum at: http://50.116.43.31:4567"
echo ""
echo "If you still see the installer, run the setup with:"
echo "./setup-forum.sh"