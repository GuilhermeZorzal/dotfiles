#!/bin/bash

# Function to load all image files from the folder and store in an array
load_images_from_folder() {
    local folder_path="$1"
    # Find all image files with common extensions and sort them
    image_files=($(ls "$folder_path" | grep -E '\.(png|jpg|jpeg|gif|bmp|tiff)$' | sort))
}

# Function to read the image name from the file
read_image_name() {
    local file_path="$1"
    # Read the first line of the file
    image_name=$(head -n 1 "$file_path")
}

# Function to calculate the next or previous index
get_next_index() {
    local current_index=$1
    local direction=$2
    local array_length=$3

    if [[ "$direction" == "next" ]]; then
        # Get the next index (loop back to the first if it's the last one)
        echo $(( (current_index + 1) % array_length ))
    elif [[ "$direction" == "previous" ]]; then
        # Get the previous index (loop back to the last if it's the first one)
        echo $(( (current_index - 1 + array_length) % array_length ))
    fi
}

# Main logic
folder_path="$HOME/Documents/git/dotfiles/wallpapers/"  # Folder where images are located
file_with_image_name="./currentWall.txt"  # File that contains the current image name

# Load images from the folder
load_images_from_folder "$folder_path"

# Read the image name from the file
read_image_name "$file_with_image_name"

# Find the index of the current image in the array
for i in "${!image_files[@]}"; do
    if [[ "${image_files[$i]}" == "$image_name" ]]; then
        current_index=$i
        break
    fi
done

# Parse command line options
while getopts "nb" option; do
    case $option in
        n) direction="next" ;;   # Next image
        b) direction="previous" ;; # Previous image
        *) echo "Usage: $0 [-n] or [-b]"; exit 1 ;;
    esac
done

# Get the next or previous image index
next_index=$(get_next_index "$current_index" "$direction" "${#image_files[@]}")

# Output the next or previous image file name
next_image="${image_files[$next_index]}"
echo "Next image: $next_image"
echo "$next_image" > "$file_with_image_name"

# Create the full path for the next or previous image
next_image_full_path="$folder_path$next_image"

echo "Full path: $next_image_full_path"

# Set the background and update wallpaper
# kitty -e wal -i "$next_image_full_path" --backend colorthief &
# sleep 1
# swaybg -i "$next_image_full_path" -m fill &
# pkill waybar 
#waybar &

echo 'kitty color'
kitty -e wal -i $next_image_full_path --backend colorthief && \
echo 'waybg'
swaybg -i $next_image_full_path -m fill  &
echo 'waybar'
sh ~/Documents/git/dotfiles/scripts/waybar_handler.sh
