#!/bin/bash

# Description: This script searches for PDF files in the specified directory (or current directory if none is given)
#              using fzf, and opens the selected PDF with zathura.

# Set directory to search in (default to current directory if not provided)
SEARCH_DIR="${1:-.}"

# Search for PDFs and open with zathura
find "$SEARCH_DIR" -type f -name "*.pdf" | fzf --preview 'pdftotext {} - | head -20' | xargs -r zathura

