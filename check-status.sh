#!/bin/bash
# Check NodeBB Status

echo "=== Checking NodeBB Status ==="
echo ""

# Check if containers are running
echo "1. Container status:"
docker-compose -p guaptalk -f docker-compose-prod.yml ps

echo ""
echo "2. Checking Redis connection:"
docker-compose -p guaptalk -f docker-compose-prod.yml exec app bash -c 'redis-cli -h guaptalk_redis ping'

echo ""
echo "3. Recent NodeBB logs:"
docker-compose -p guaptalk -f docker-compose-prod.yml logs --tail=20 app | grep -E "(error|Error|started|listening)"

echo ""
echo "4. Testing NodeBB endpoint:"
curl -s -o /dev/null -w "HTTP Status: %{http_code}\n" http://localhost:4567

echo ""
echo "=== Status Check Complete ==="