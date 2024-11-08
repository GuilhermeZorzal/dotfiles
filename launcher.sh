#!/bin/bash

# Directory containing the Bash scripts
	SCRIPT_DIR="$HOME/Documentos/git/dotfiles/scripts/"  # Change this to your scripts folder

# List all Bash scripts, show only their names in dmenu, and keep paths for execution
script_paths=$(find "$SCRIPT_DIR" -type f -name "*.sh")
script_names=$(basename -a $script_paths)

# Use associative array to map names to full paths
declare -A script_map
for script in $script_paths; do
    script_map["$(basename "$script")"]="$script"
done

# Show the script names in dmenu and get the selected script name
selected_script_name=$(echo "$script_names" | wofi --show dmenu --prompt "Select script:")

# Execute the selected script if it exists in the map
if [[ -n $selected_script_name && -n ${script_map[$selected_script_name]} ]]; then
    bash "${script_map[$selected_script_name]}"
fi
