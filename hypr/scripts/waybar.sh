#!/bin/bash

killall -q waybar
# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done
waybar -c ~/.config/hypr/additionalWaybarConfigs/lateralBar/config.jsonc -s ~/.config/hypr/additionalWaybarConfigs/lateralBar/style.css &
