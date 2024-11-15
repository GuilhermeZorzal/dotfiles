#!/bin/bash

# Define the root directory to search
ROOT_DIR="$HOME/.config/waybar/additionalConfigs/"
waybarFolder="$HOME/.config/waybar/"
scripts="$HOME/.config/scripts/general"

# Check if the provided directory exists
if [ ! -d "$ROOT_DIR" ]; then
    echo "Error: Directory '$ROOT_DIR' does not exist."
    exit 1
fi

# Get all folders inside the root directory
folders=($(find "$ROOT_DIR" -mindepth 1 -maxdepth 1 -type d | sort))

# Check if any folders were found
if [ ${#folders[@]} -eq 0 ]; then
    echo "No folders found in '$ROOT_DIR'."
    exit 0
fi

# Display the folders as a numbered list (show only the folder names)
echo "Folders in '$ROOT_DIR':"
for i in "${!folders[@]}"; do
    folder_name=$(basename "${folders[i]}")
    echo "$((i+1)). $folder_name"
done

# Prompt the user for a selection
read -p "Enter the number of the folder: " choice

# Validate the user's input
if [[ ! "$choice" =~ ^[0-9]+$ ]] || ((choice < 1 || choice > ${#folders[@]})); then
    echo "Invalid choice. Please enter a number between 1 and ${#folders[@]}."
    exit 1
fi

# Display the selected folder path
selected_folder="${folders[choice-1]}"
echo "You selected: $selected_folder"

cat "$selected_folder/config.jsonc" > "$waybarFolder/config.jsonc"
cat "$selected_folder/style.css" > "$waybarFolder/style.css"
sleep 1
sh "$scripts/waybar_handler.sh"

