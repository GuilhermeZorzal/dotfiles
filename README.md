# Dotfiles

Repository for storing my dotfiles.
The main idea of this readme is to give the main steps to configure my system to run exactly as I'm used to.

## Firefox

Access `about:config` and set `full-screen-api.ignore-widgets` to true
Bookmarks -> Show only on the new tabs
browser.compactmode.show true
enable on the config (three lines) on the menu bar > more tools > customize toolbar > density > compact

### Firefox Extensions:
- (dark reader)[https://addons.mozilla.org/en-US/firefox/addon/darkreader/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (youtube speed)[https://addons.mozilla.org/en-US/firefox/addon/youtube-speed-control/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (ublock)[https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]
- (SoundFixer)[https://addons.mozilla.org/en-GB/firefox/addon/soundfixer/] - for audio mono
- (vim-scroll)[https://addons.mozilla.org/pt-BR/firefox/addon/vim-scroll/?utm_source=addons.mozilla.org&utm_medium=referral&utm_content=search]

## Configure git and github

- Generate and store the ssh key using the steps from (this)[https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]

- Configuring branch to automaticaly have its counterpart on the remote as you push
`git config --global push.autoSetupRemote true`

- Setting a alias for the tree log view
`git config --global alias.tree 'log --oneline --graph --decorate --all'`

## Obsidian

Installed throught the gnome applications interface (gnome)
Configs:
- Git plugin
- github theme
- Typewriter scroll (mantain the line being edited on center)
- Hider (util for hidding some components of the obsidian screen that are not natively supported, like the bars, tabs, etc)
- VariousComplements

## Docker 

The steps can be checked on the oficial website
```
 sudo dnf -y install dnf-plugins-core

 sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

 sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Oh my zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Nerd Fonts

Install a nerd font of the official site
Extract te zip and move all the files to /usr/share/fonts/ 
run `fc-cache -fv`

Adicionar uma config de waybar dentro de cada config do tiling manager (uma config dentro de hypr/ e uma dentro de sway/)
