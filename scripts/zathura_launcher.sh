#!/bin/bash

# Find all PDF files in the home directory
file=$(find ~ -type f -name "*.pdf" | fzf --prompt="Select a PDF: "
#    --preview 'pdftotext -l 3 -nopgbrk {} - | head -n 30'
)
# Define the directory where PDF files are located
# PDF_DIR="$HOME/Documents"  # Change this to the directory containing your PDFs

echo $file

# Check if a PDF was selected
if [[ -n "$file" ]]; then
    # Close the terminal and open the selected PDF with zathura
	setsid zathura "$file"

    exit
else
    echo "No PDF selected."
fi
