#!/bin/bash

echo "=== Fixing composer import issue in NodeBB ==="

# First, ensure we're in the right directory
cd /root/guaptalk-forum

# Pull latest changes
echo "Pulling latest changes from git..."
git pull

# Copy the fixed file from host to container
echo "Copying fixed topicThumbs.js to container..."
docker cp ./public/src/modules/topicThumbs.js guaptalk_app:/usr/src/app/public/src/modules/topicThumbs.js

# Fix ownership
echo "Fixing file ownership..."
docker exec guaptalk_app chown nodebb:nodebb /usr/src/app/public/src/modules/topicThumbs.js

echo "File updated successfully."

echo ""
echo "Running build..."
docker exec guaptalk_app ./nodebb build

echo ""
echo "Restarting container..."
docker restart guaptalk_app

echo ""
echo "Waiting for startup..."
sleep 20

echo ""
echo "Checking status..."
# Use wget instead of curl since curl might not be installed
docker exec guaptalk_app wget -O- -q --spider http://localhost:4567 && echo "NodeBB is running!" || echo "NodeBB might still be starting..."

# Alternative: check container logs
echo ""
echo "Recent container logs:"
docker logs --tail 20 guaptalk_app

echo ""
echo "=== Fix complete ==="
echo "You can verify the fix worked by checking if the build completed without webpack errors in the logs above."