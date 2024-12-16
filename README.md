# dotfiles
Repository for storing dotfiles

## Basic configurations

### Firefox

Access `about:config` and set `full-screen-api.ignore-widgets` to true
Bookmarks -> Show only on the new tabs
browser.compactmode.show true
enable on the config (three lines) on the menu bar > more tools > customize toolbar > density > compact

### Zen Browser

EXCEPTIONAL with shortcuts and theme.
Binded alt+hjkl for workspaces and tabs switching

#### Extensions:
- (dark reader)[https://addons.mozilla.org/en-US/firefox/addon/darkreader/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (youtube speed)[https://addons.mozilla.org/en-US/firefox/addon/youtube-speed-control/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (ublock)[https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (SoundFixer)[https://addons.mozilla.org/en-GB/firefox/addon/soundfixer/] - para audio mono
- (vim-scroll)[https://addons.mozilla.org/pt-BR/firefox/addon/vim-scroll/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]

### Configure git and github

generate and store the ssh key using the steps from (this)[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]

#### Configuring branch to automaticaly have its counterpart on the remote as you push
git config push.autoSetupRemote true

##### Setting a alias for the tree log view
git config --global alias.tree 'log --oneline --graph --decorate --all'

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
blueman \
clipman \
stow \
hypridle \
yt-dlp \
wlsunset
```


Installing mpd and ncmpcpp
```
 sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install mpd ncmpcpp
```


## Not in dnf:
ttyclock

## Obsidian

Installed throught the gnome applications interface (gnome)
Configs:
- Git plugin
- github theme
- Typewriter scroll (mantain the line being edited on center)
- Hider (util for hidding some components of the obsidian screen that are not natively supported, like the bars, tabs, etc)

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

IMPORTANT ADDITION:
Use a colored man pages plugin for zsh. It is very useful. 

## Pywal

using pip
sudo pip3 install pywal

more info in https://github.com/dylanaraps/pywal/wiki/Customization

also, install colorthief by `pip install colorthief`

## Nerd Fonts

Install a nerd font of the official site
Extract te zip and move all the files to /usr/share/fonts/ 
run `fc-cache -fv`

## Config themes

On gnome-tweaks, change theme to HighContrastInverse

## Ranger

### Installing icons

use the (ranger_devicons)[https://github.com/alexanderjeurissen/ranger_devicons/tree/a8d626485ca83719e1d8d5e32289cd96a097c861] plugin. 

## IMPORTANT BUG FIX

Ranger has a bug that has not been released to the oficial packages yet: when you make some actions when a image is selected (using kitty as the terminal emulator) it freezes. The workaround can be found in (here)[https://github.com/ranger/ranger/pull/1758/files] . The file to be edited is in `lib/python3.12/site-packages/ranger/ext/img_display.py`

# GNOME CONFIG

Install gnome tweaks
install forge (tilling manager para o gnome) https://extensions.gnome.org/extension/4481/forge/

## Change overlay view

dconf editor
-> org/gnome/mutter/overlay-key => set to ""

on configuration of gnome shortcuts:
-> search "overview" and change to super space

# TODO:

Fazer branch minimalista

Mudar as configurações do waybar pra só aparecer em hover (talvez window hide, hover height = 10)

Add shortcut to create new window outside current group

Ao configurar o waybar, deve-se dizer explicitamente que configuração se deseja (margin: 0px não é o default por exemplo e não faço a mínima ideia do que seja)

## Waybar

Configurar a waybar pra rodar dessa forma (fica mais genérica pra poder mexer)
waybar -c ~/.config/waybar/additionalConfigs/transparentTopBar/config.jsonc -s .config/waybar/additionalConfigs/transparentTopBar/style.css 

Adicionar uma config de waybar dentro de cada config do tiling manager (uma config dentro de hypr/ e uma dentro de sway/)

# Verificar

O dispatcher abaixo troca os workspaces entre dois monitores. Muito útil. Precisa de ser testado 
swapactiveworkspaces


