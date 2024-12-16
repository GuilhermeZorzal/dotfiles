#!/bin/bash

# Function to display the list of files
display_files() {
    echo "Files in the directory:"
    for i in "${!files[@]}"; do
        echo "$((i+1)). ${files[$i]}"
    done
    echo "0. Exit"
}

# Prompt user for the directory to scan
dir="$HOME/.config/sway/appearence"
# Validate the directory
if [[ ! -d "$dir" ]]; then
    echo "Invalid directory. Exiting."
    exit 1
fi

# Get all files in the directory
mapfile -t files < <(ls -1 "$dir")

# Main loop
while true; do
    # Display the list of files
    display_files

    # Prompt user for an index
    read -p "Enter the file number (or 0 to exit): " index

    # Check if the user wants to exit
    if [[ "$index" -eq 0 ]]; then
        echo "Exiting. Goodbye!"
        break
    fi

    # Validate the index
    if [[ "$index" -gt 0 && "$index" -le "${#files[@]}" ]]; then
        selected_file="${files[$((index-1))]}"
        echo "Selected file path: $dir/$selected_file"
        rm ~/.config/sway/config.d/appearence
        ln -s $dir/$selected_file ~/.config/sway/config.d/appearence
        nohup swaymsg reload
        nohup sh ~/.config/sway/waybar.sh &

        exit
    else
        echo "Invalid choice. Please select a valid number from the list."
    fi
done
