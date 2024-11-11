caminho=""
read -p "Caminho do site: " caminho
# brave-browser --app="$caminho"
firefox --new-window $caminho
