#!/usr/bin/env bash

if pgrep -x "wlsunset" > /dev/null; then
    echo "Stopping wlsunset..."
    pkill -x "wlsunset"
else
    echo "Starting wlsunset..."
    # Adjust the following arguments as per your preference
    wlsunset
fi
