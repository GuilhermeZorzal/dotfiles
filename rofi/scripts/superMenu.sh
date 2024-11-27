#!/usr/bin/env bash
wallpapers="~/.config/wallpapers/"
if [ x"$@" = x"quit" ]
then
    exit 0
fi
if [ x"$@" = x"ChatGPT" ]
then
    firefox --new-window https://chatgpt.com/?temporary-chat=true &
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Iniciação Científica Frontend" ]
then
    kitty --detach -e nvim ~/Documents/git/causal-inference-web-frontend/src/
    pkill rofi
    exit 0
fi
if [ x"$@" = x"LocalHost:3000" ]
then
    firefox --new-window http://localhost:3000 &
    pkill rofi
    exit 0
fi
if [ x"$@" = x"LocaHost:8080" ]
then
    firefox --new-window http://localhost:8080 &
    pkill rofi
    exit 0
fi
if [ x"$@" = x"LocalHost:8000" ]
then
    nohup firefox --new-window http://localhost:8000
    pkill rofi
    exit 0
fi
if [ x"$@" = x"PI - Projeto Integrador" ]
then
    kitty --detach -e nvim ~/Documents/git/Equipe-4Ano/digitovsky/frontend/src/pages/
    exit 0
fi
if [ x"$@" = x"Wallpaper" ]
then

    kitty --detach -e ranger ~/.config/wallpapers/
    exit 0
fi
if [ x"$@" = x"Waybar (fix, update)" ]
then
    nohup sh ~/.config/waybar/waybar.sh &
    exit 0
fi
if [ x"$@" = x"Whatsapp" ]
then
    firefox --new-window --kiosk https://web.whatsapp.com/
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Zathura" ]
then
    kitty --detach -T "zathura-launcher" -e sh ~/.config/scripts/general/zathura_launcher.sh
    exit 0
fi
if [ x"$@" = x"Configurations" ]
then
    kitty --detach -e nvim ~/.config/dotfiles/
    exit 0
fi
echo "Configurations"
echo "ChatGPT"
echo "LocalHost:3000"
echo "LocalHost:8080"
echo "LocalHost:8000"
echo "Iniciação Científica Frontend"
echo "PI - Projeto Integrador"
echo "Wallpaper"
# echo "Waybar (fix, update)"
echo "Whatsapp"
echo "Zathura"
echo "quit"

