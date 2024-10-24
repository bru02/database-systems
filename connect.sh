#!/bin/bash

# Connect to the PPPoE service
/usr/sbin/networksetup -connectpppoeservice "BCE VPN"

# Wait for the connection to establish
while true; do
    if scutil --nc status "BCE VPN" | grep -q "Status : 2"; then
        echo "Connection established."
        break
    fi
    echo "Waiting for connection..."
    sleep 1  # Wait for 1 second before checking again
done
