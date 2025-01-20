#!/bin/bash

# Find all PDF files in the home directory
file=$(find ~ -path ~/.local -prune -o -type f -name "*.pdf" | fzf --prompt="Select a PDF: "
#    --preview 'pdftotext -l 3 -nopgbrk {} - | head -n 30'
)
# Define the directory where PDF files are located
# PDF_DIR="$HOME/Documents"  # Change this to the directory containing your PDFs

echo $file

# Check if a PDF was selected
if [[ -n "$file" ]]; then
    # Close the terminal and open the selected PDF with zathura
	# setsid zathura "$file" > 

	setsid zathura "$file" >/dev/null 2>&1 < /dev/null &

	# Capture the terminal's process ID (PPID of the script)
	TERMINAL_PID=$(ps -o ppid= -p $$ | tail -1 | tr -d ' ')

	# Kill the terminal process
	kill "$TERMINAL_PID"

    exit
else
    echo "No PDF selected."
fi
