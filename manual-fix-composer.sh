#!/bin/bash

echo "=== Manual fix for composer import issue ==="
echo "This script will directly edit the file inside the container"

# Enter the container and fix the file
docker exec guaptalk_app sh -c "
cd /usr/src/app/public/src/modules

# Backup the original file
cp topicThumbs.js topicThumbs.js.backup

# Use sed to add 'composer' to the dependencies
sed -i \"s/'translator', 'jquery-ui/'translator', 'composer', 'jquery-ui/g\" topicThumbs.js
sed -i \"s/translator) {/translator, composer) {/g\" topicThumbs.js

# Remove the require(['composer'] calls and fix the code
sed -i '/require.*composer.*{/,/});/{s/require.*composer.*{//;s/});$//;}' topicThumbs.js

echo 'File modifications complete.'
"

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
echo "Checking status with docker ps..."
docker ps | grep guaptalk_app

echo ""
echo "Recent container logs:"
docker logs --tail 30 guaptalk_app | grep -E "(error|Error|ERROR|started|listening)"

echo ""
echo "=== Manual fix complete ==="