folder_path="$HOME/Documents/git/dotfiles/"  # Folder where images are located
file_with_image_name="$HOME/.config/waybar/scripts/currentWall.txt"  # File that contains the current image name

sleep 5

image="$(swww query | awk -F'image: ' '{print $2}')"

echo $image
if [[ -n "$image" ]]; then
  convert $image -blur 0x8 ~/.config/hypr/blur.png
  echo "$image" > "$file_with_image_name"
else
    echo "Error: The file '$custom_image' does not exist."
    exit 1
fi
