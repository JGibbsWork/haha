#!/bin/bash

# Debug log location
echo "[$(date)] Starting Pi-hole login script..." >> /config/pihole_debug.log

# Login and extract tokens
RESPONSE=$(curl -s -X POST http://10.0.0.162/api/auth \
  --data '{"password":"46HIWhrx"}')

echo "[$(date)] Raw response: $RESPONSE" >> /config/pihole_debug.log

SID=$(echo "$RESPONSE" | jq -r '.session.sid')
CSRF=$(echo "$RESPONSE" | jq -r '.session.csrf')

echo "[$(date)] Parsed SID: $SID" >> /config/pihole_debug.log
echo "[$(date)] Parsed CSRF: $CSRF" >> /config/pihole_debug.log

# Write tokens to file
echo "$SID,$CSRF" > /media/pihole_tokens.txt

echo "[$(date)] Tokens written to /media/pihole_tokens.txt" >> /media/pihole_debug.log