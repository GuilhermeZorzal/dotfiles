#!/bin/bash
status=$(mpc status | grep -o 'playing\|paused')

# Check if MPD is playing
if [[ $status == "playing" ]]; then
    mpc pause
else
    mpc play
fi
