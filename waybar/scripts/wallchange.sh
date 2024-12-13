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

# Function to set the wallpaper
set_wallpaper() {
    local image_path="$1"
    echo "Setting wallpaper: $image_path"
    echo "$image_path" > "$file_with_image_name"
    
    # Set the background and update wallpaper
    echo 'Setting kitty colors'
    wal -i "$image_path" --backend colorthief && \
    echo 'Setting swaybg'

    nohup swaybg -i "$image_path" -m fill & # Quando o terminal for fechado a imagem será preservada
    echo 'Updating Waybar'
    ln -sf "$image_path" ~/.config/hypr/image
}

# Main logic
folder_path="$HOME/Documents/git/dotfiles//"  # Folder where images are located
file_with_image_name="$HOME/.config/waybar/scripts/currentWall.txt"  # File that contains the current image name

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

custom_image=""
# Parse command line options
while getopts "nbp:" option; do
    case $option in
        n) direction="next" ;;   # Next image
        b) direction="previous" ;; # Previous image
        p) custom_image="$OPTARG" ;;     # Custom image path
        *) echo "Usage: $0 [-n] [-b] [-p <image_path>]"; exit 1 ;;
    esac
done

# Get the next or previous image index
next_index=$(get_next_index "$current_index" "$direction" "${#image_files[@]}")

# Output the next or previous image file name
next_image="${image_files[$next_index]}"
echo "Next image: $next_image"

if [[ -n "$custom_image" ]]; then
    echo "AAAAAAAAAA"
    # Validate the custom image path
    if [[ -f "$custom_image" ]]; then
        echo 'kitty color'
        wal -i $custom_image --backend colorthief && \
        echo 'waybg'
        pkill swaybg
        nohup swaybg -i $custom_image -m fill  &
        echo 'waybar'
        # sh ~/.config/scripts/general/waybar_handler.sh
        ln -sf $custom_image ~/.config/hypr/image
        echo "$custom_image" > "$file_with_image_name"
    else
        echo "Error: The file '$custom_image' does not exist."
        exit 1
    fi
else
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
    wal -i $next_image_full_path --backend colorthief && \
    echo 'waybg'
    pkill swaybg
    nohup swaybg -i $next_image_full_path -m fill  &
    echo 'waybar'
    # sh ~/.config/scripts/general/waybar_handler.sh
    ln -sf $next_image_full_path ~/.config/hypr/image
fi
