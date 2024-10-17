#!/bin/bash

# Check if mpd is running
if pgrep -x "mpd" > /dev/null
then
    # mpd is running, open ncmpcpp
    alacritty -e ncmpcpp
else
    # mpd is not running, start mpd, update music library, and open ncmpcpp
    mpd && mpc update && alacritty -e ncmpcpp
fi

