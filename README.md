# dotfiles
Repository for storing dotfiles

## Basic configurations

### Firefox

Access `about:config` and set `full-screen-api.ignore-widgets` to true
Bar -> Show only on the tabs
browser.compactmode.show true
enable on the config (three lines) on the menu bar > more tools > customize toolbar > density > compact



#### Extensions:
- (dark reader)[https://addons.mozilla.org/en-US/firefox/addon/darkreader/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (youtube speed)[https://addons.mozilla.org/en-US/firefox/addon/youtube-speed-control/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (ublock)[https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]

### Configure git and github

generate and store using (this)[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]


## Dependencies

```
sudo dnf install -y \
neovim \
bat \
zsh \
waybar \
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
blueman
```
sudo dnf install -y neovim bat zsh waybar cava cmatrix hyprland hyprlock zathura wofi btop kitty fzf gnome-tweaks fastfetch python3-pip wlogout NetworkManager-tui

## Not in dnf:
ttyclock

## Obsidian

Installed throught the gnome applications interface (gnome)
Configs:
- Git plugin
- github theme

## Docker 
```
 sudo dnf -y install dnf-plugins-core

 sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

 sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Oh my zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Pywal

using pip
sudo pip3 install pywal

more info in https://github.com/dylanaraps/pywal/wiki/Customization

also, install colorthief by `pip install colorthief`

## Nerd Fonts

Install a nerd font of the official site
Extract te zip and move all the files to /usr/share/fonts/ 
run `fc-cache -fv`

# TODO:

Fazer branch minimalista
Mudar as configurações do waybar pra só aparecer em hover (talvez window hide, hover height = 10)
Add shortcut to create new window outside current group
