#!/bin/bash

# Function to read the image name from the file
read_image_name() {
    local file_path="$1"
    # Read the first line of the file
    image_name=$(head -n 1 "$file_path")
}

# Main logic
folder_path="$HOME/.config/wallpapers/"  # Folder where images are located
file_with_image_name="$HOME/.config/hypr/scripts/currentWall.txt"  # File that contains the current image name


# Read the image name from the file
read_image_name "$file_with_image_name"

# Create the full path for the next or previous image
echo $image_name
current_image="$image_name"

echo 'waybg'
echo $current_image

waybar -c /home/guizo/.config/sway/swayTopBar/config.jsonc -s /home/guizo/.config/sway/swayTopBar/style.css
swaybg -i $current_image -m fill &
echo $current_image
