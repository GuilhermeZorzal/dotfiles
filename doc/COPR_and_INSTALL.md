# COPR

List of enabled copr to install some software

copr.fedorainfracloud.org/atim/lazygit
copr.fedorainfracloud.org/lihaohong/yazi
copr.fedorainfracloud.org/pennbauman/ports
copr.fedorainfracloud.org/phracek/PyCharm
copr.fedorainfracloud.org/solopasha/hyprland
copr.fedorainfracloud.org/swayfx/swayfx

or run:
```
sudo dnf copr enable atim/lazygit
sudo dnf copr enable lihaohong/yazi
sudo dnf copr enable pennbauman/ports
sudo dnf copr enable phracek/PyCharm
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable swayfx/swayfx
```

after enabling the copr repos, its possible to install everything:
```
sudo dnf install -y \
neovim \
zsh \
waybar \
bat \
cava \
cmatrix \
hyprland \
hyprlock \
zathura \
wofi \
btop \
kitty \
fzf \
gnome-tweaks \
fastfetch \
python3-pip \
wlogout \
NetworkManager-tui \
zathura-pdf-mupdf \
blueman \
clipman \
hypridle \
yt-dlp \
wlsunset \
yazi \

```

Installing mpd and ncmpcpp
```
 sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install mpd ncmpcpp mpc

```

## Waypaper
sudo dnf copr enable solopasha/hyprland
sudo dnf install waypaper

