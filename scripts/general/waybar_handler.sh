#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null; then
    echo "Waybar is running. Restarting..."
    pkill -x waybar
else
    echo "Waybar is not running. Starting..."
fi

# Start waybar
nohup waybar > /dev/null 2>&1 &
