#!/bin/bash
# Debug and Fix Build Issues

echo "=== Debugging NodeBB Build ==="
echo ""

# Check if build directory exists in container
echo "1. Checking build directory in container:"
docker-compose -p guaptalk -f docker-compose-prod.yml exec app ls -la /usr/src/app/build/

echo ""
echo "2. Running build with verbose output:"
docker-compose -p guaptalk -f docker-compose-prod.yml exec app bash -c 'cd /usr/src/app && ./nodebb build'

echo ""
echo "3. Checking build directory after build:"
docker-compose -p guaptalk -f docker-compose-prod.yml exec app ls -la /usr/src/app/build/

echo ""
echo "4. Checking if templates exist:"
docker-compose -p guaptalk -f docker-compose-prod.yml exec app find /usr/src/app/build -name "*.tpl" | head -5

echo ""
echo "5. Restarting container:"
docker-compose -p guaptalk -f docker-compose-prod.yml restart app

echo ""
echo "Waiting 20 seconds for startup..."
sleep 20

echo ""
echo "6. Final status check:"
curl -I http://localhost:4567