#!/usr/bin/env bash
wallpapers="~/.config/wallpapers/"
if [ x"$@" = x"quit" ]
then
    exit 0
fi
if [ x"$@" = x"Bluetooth off" ]
then
    bluetoothctl power off
    pkill rofi
    exit 0
fi
if [[ x"$@" = x"mpd" || x"$@" = x"ncmpcpp" || x"$@" = x"Music" ]]
then
    if pgrep -x mpd > /dev/null
    then
        kitty -T "music-ncmpcpp" --detach -e ncmpcpp
        pkill rofi
    else 
        mpd
        kitty -T "music-ncmpcpp" --detach -e ncmpcpp
        pkill rofi
    fi
    exit 0
fi
if [ x"$@" = x"

    " ]
then
    exit 0
fi
if [ x"$@" = x"Music Pause" ]
then
    mpc pause
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Music Play" ]
then
    mpc play
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Music Play/Pause" ]
then
    mpc toggle
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Music Stop" ]
then
    mpc stop
    pkill rofi
    exit 0
fi
if [ x"$@" = x"Music Kill" ]
then
    killall mpd
    exit 0
fi
if [[ x"$@" = x"DuckDuckGo" || x"$@" = x"Browser" ]]
then
    firefox --profile /home/guizo/.cache/mozilla/firefox/l0vai9ko.kioskMode --new-window  https://duckduckgo.com/ &
     pkill rofi
    exit 0
fi
if [ x"$@" = x"ChatGPT" ]
then
    firefox  --new-window  https://chatgpt.com/?temporary-chat=true --profile /home/guizo/.cache/mozilla/firefox/l0vai9ko.kioskMode &
     pkill rofi
    exit 0
fi
if [ x"$@" = x"IC - Backend" ]
then
    cd ~/Documents/git/causal-inference-web-backend/
    kitty --detach -e nvim .
    pkill rofi
    exit 0
fi
if [ x"$@" = x"IC - Frontend" ]
then
    cd ~/Documents/git/causal-inference-web-frontend/src/
    kitty --detach -e nvim .
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
    cd ~/Documents/git/Equipe-4Ano/digitovsky 
    kitty --detach -e nvim ./frontend/src/pages/

    exit 0
fi
if [ x"$@" = x"Wallpaper" ]
then

    kitty --detach -e ranger ~/Documents/git/dotfiles/wallpapers/
    exit 0
fi
if [ x"$@" = x"Waybar (fix, update)" ]
then
    nohup sh ~/.config/waybar/waybar.sh &
    pkill rofi
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
    kitty --detach -T "zathura-launcher" -e sh ~/Documents/git/dotfiles/scripts/general/zathura_launcher.sh
    exit 0
fi
if [ x"$@" = x"Configurations" ]
then
    cd ~/Documents/git/dotfiles/
    kitty --detach -e nvim .
    exit 0
fi
if [ x"$@" = x"Configurations" ]
then
    exit 0
fi
if [ x"$@" = x"Wifi on" ]
then
    nmcli radio wifi on
    exit 0
fi
if [ x"$@" = x"Wifi off" ]
then
    nmcli radio wifi off
    exit 0
fi
if [ x"$@" = x"Appearence" ]
then
    kitty --detach --hold -e sh ~/.config/sway/appearence.sh  2> /dev/null
    exit 0
fi
echo "Configurations"
echo "Appearence"
echo "ChatGPT"
echo "LocalHost:3000"
echo "LocalHost:8080"
echo "LocalHost:8000"
echo "IC - Frontend"
echo "IC - Backend"
echo "PI - Projeto Integrador"
echo "Wallpaper"
echo "Waybar (fix, update)"
echo "Whatsapp"
echo "mpd"
echo "ncmpcpp"
echo "Music"
echo "Music Pause"
echo "Music Play"
echo "Music Play/Pause"
echo "Music Stop"
echo "Music Kill"
echo "Bluetooth off"
echo "Wifi on"
echo "Wifi off"
echo "Zathura"
echo "quit"

