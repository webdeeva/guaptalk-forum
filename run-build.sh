#!/bin/bash
# Run NodeBB Build

echo "=== Running NodeBB Build ==="
echo ""

# Run build inside the container
echo "1. Building NodeBB assets..."
docker-compose -p guaptalk -f docker-compose-prod.yml exec app ./nodebb build

echo ""
echo "2. Restarting NodeBB..."
docker-compose -p guaptalk -f docker-compose-prod.yml restart app

echo ""
echo "3. Waiting for NodeBB to start..."
sleep 15

echo ""
echo "4. Checking status..."
docker-compose -p guaptalk -f docker-compose-prod.yml logs --tail=10 app

echo ""
echo "=== Build Complete! ==="
echo "Access forum at: http://50.116.43.31:4567"