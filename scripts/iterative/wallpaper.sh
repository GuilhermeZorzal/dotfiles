#!/bin/bash

# Navigate to the wallpapers directory
cd ~/.config/wallpapers/

# Use fzf to select a file with a preview
file=$(fzf --preview 'chafa {}' --preview-window=right:90%)

# Construct the full file path
file="$HOME/.config/wallpapers/$file"
echo "$file"

# Check if a file was selected
if [[ -n "$file" ]]; then
    # Run the commands inside a new shell
    bash -c "
        wal -i \"$file\" --backend colorthief &
        swaybg -i \"$file\" -m fill &
        sh \"$HOME/.config/scripts/general/waybar_handler.sh\" &
        ln -sf \"$file\" \"$HOME/.config/hypr/image\"
        echo \"$file\" > \"$HOME/.config/waybar/scripts/currentWall.txt\"
    "
    exit
else
    echo "No file selected."
fi
