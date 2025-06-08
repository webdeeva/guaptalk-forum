#!/bin/bash

echo "=== Direct fix for composer module issue ==="

# First, let's ensure the composer module proxy exists in the build directory
echo "1. Creating composer module proxy in build directory..."
docker exec guaptalk_app sh -c "mkdir -p /usr/src/app/build/public/src/modules && echo \"module.exports = require('../../../../node_modules/nodebb-plugin-composer-default/static/lib/composer.js');\" > /usr/src/app/build/public/src/modules/composer.js"

# Now update the topicThumbs.js file
echo ""
echo "2. Updating topicThumbs.js file..."
docker exec guaptalk_app sh -c "
cd /usr/src/app/public/src/modules

# Create a backup
cp topicThumbs.js topicThumbs.js.backup 2>/dev/null || true

# Use sed to fix the file
sed -i '3,5s/define.*$/define('\''topicThumbs'\'', [/' topicThumbs.js
sed -i \"4s/.*/'api', 'bootbox', 'alerts', 'uploader', 'benchpress', 'translator', 'composer', 'jquery-ui\/widgets\/sortable',/\" topicThumbs.js
sed -i '5s/.*/], function (api, bootbox, alerts, uploader, Benchpress, translator, composer) {/' topicThumbs.js

# Fix the require calls
sed -i 's/require(\['\''composer'\''\], (composer) => {//' topicThumbs.js
sed -i '/composer\.updateThumbCount.*$/,/});$/{s/});$//}' topicThumbs.js
"

echo ""
echo "3. Verifying the changes..."
docker exec guaptalk_app grep -n "composer" /usr/src/app/public/src/modules/topicThumbs.js | head -5

echo ""
echo "4. Running build..."
docker exec guaptalk_app ./nodebb build

echo ""
echo "5. Restarting container..."
docker restart guaptalk_app

echo ""
echo "Waiting 20 seconds for startup..."
sleep 20

echo ""
echo "6. Final check - looking for errors in logs:"
docker logs --tail 50 guaptalk_app | grep -i "error\|webpack\|compiled" || echo "No errors found in recent logs"

echo ""
echo "=== Direct fix complete ==="