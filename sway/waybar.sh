#!/bin/bash

killall -q waybar
# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
waybar -c ~/.config/waybar/configs/Simple\ Top\ Bar\ Sway.jsonc -s ~/.config/waybar/styles/Simple\ Top\ Bar\ Sway\.css
