#!/bin/bash
# Verify Forum Status

echo "=== Verifying Forum Status ==="
echo ""

# Check what's being served
echo "1. Checking homepage content:"
curl -s http://localhost:4567 | grep -E "(NodeBB|Guaptalk|Welcome)" | head -5

echo ""
echo "2. Checking if it's the installer or forum:"
if curl -s http://localhost:4567 | grep -q "NodeBB Web Installer"; then
    echo "⚠️  Still showing installer page"
    echo ""
    echo "3. Running automated setup..."
    docker-compose -p guaptalk -f docker-compose-prod.yml exec app bash -c './nodebb setup --skip-build << EOF
admin
gurldeeva@gmail.com
Olokun2026!
Olokun2026!
EOF'
    
    echo ""
    echo "4. Building assets..."
    docker-compose -p guaptalk -f docker-compose-prod.yml exec app ./nodebb build
    
    echo ""
    echo "5. Restarting NodeBB..."
    docker-compose -p guaptalk -f docker-compose-prod.yml restart app
    
    echo ""
    echo "Setup complete! Wait 30 seconds then check http://50.116.43.31:4567"
else
    echo "✅ Forum is running (not installer)"
    echo ""
    echo "Access your forum at:"
    echo "  - http://50.116.43.31:4567"
    echo "  - https://guaptalk.xyz (after SSL setup)"
fi

echo ""
echo "=== Verification Complete ==="