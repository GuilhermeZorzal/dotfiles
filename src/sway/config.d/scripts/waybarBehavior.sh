#!/bin/bash

# Check if waybar is running
if pgrep -x "waybar" > /dev/null
then
    # If its running, just opens the terminal
    alacritty
else
    # If not, start waybar and the terminal
    waybar & 
    alacritty
fi

