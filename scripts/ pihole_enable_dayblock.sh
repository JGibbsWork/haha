#!/bin/bash

# Login
RESPONSE=$(curl -s -X POST http://10.0.0.162/api/auth \
  --data '{"password":"46HIWhrx"}')

SID=$(echo "$RESPONSE" | jq -r '.session.sid')
CSRF=$(echo "$RESPONSE" | jq -r '.session.csrf')

# API call to enable the group
curl -s -X PUT "http://10.0.0.162/api/groups/dayBlock" \
  -H "X-FTL-CSRF: $CSRF" \
  -H "X-FTL-SID: $SID" \
  -H "Cookie: sid=$SID" \
  -H "Content-Type: application/json" \
  --data '{"name": "dayBlock", "enabled": true}'