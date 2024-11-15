#!/bin/bash

# Find all PDF files in the home directory
cd ~/.config/wallpapers/
file=$(fzf --preview 'chafa {}' --preview-window=right:60%
)
# Define the directory where PDF files are located
# PDF_DIR="$HOME/Documents"  # Change this to the directory containing your PDFs

file="$HOME/.config/wallpapers/$file"
echo $file

# Check if a PDF was selected
if [[ -n "$file" ]]; then
    # Close the terminal and open the selected PDF with zathura
	# setsid zathura "$file" > 

	wal -i $file --backend colorthief &
	swaybg -i $file -m fill  &
	sh $HOME/.config/scripts/general/waybar_handler.sh &
	ln -sf $file $HOME/.config/hypr/image
	echo $file > "$HOME/.config/waybar/scripts/currentWall.txt"
    exit
else
    echo "No PDF selected."
fi
