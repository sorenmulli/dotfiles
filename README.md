# My configuration


## Setup:

Clone to `~/`

### ZSH

`zsh` package from package man.

`antibody` from AUR or install from [releases page](https://github.com/getantibody/antibody/releases)

Run

`echo "ZDOTDIR=$HOME/dotfiles/zsh" > ~/.zshenv`

then 

`chsh -s $(which zsh)`

Reboot for `chsh` to take effect.
Run `antiplug` for plugin install.

### VIM

Install `gvim` or `vim-gtk3` from package man.

Set terminal to solarized.

Run `:PlugInstall` for plugin install.

### konsole
`ln -s ~/dotfiles/konsole/WhiteOnBlack.colorscheme ~/.local/share/konsole/WhiteOnBlack.colorscheme`
`ln -s ~/dotfiles/konsole/Shell.profile ~/.local/share/konsole/Shell.profile`

### ranger

Install `ranger`, then create `~/.config/ranger/rc.conf` with content `source ~/dotfiles/ranger/rc.conf`
Install `w3m` for image previews.

### tmux
Install `tmux` then create config symlink by `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

### KDE and app visuals
kwin tiling script + settings

### Key remap
Run (for change of ESC and Caps Lock)

This might work: 

`cp ~/dotfiles/setup/speedswapper.desktop ~/.config/autostart/speedswapper.desktop`


 Another possibility is the more stable xkb. For this, run

`xmodmap ~/dotfiles/setup/speedswapper`

`xkbcomp $DISPLAY $HOME/.xkbmap`

Then make the following run on startup (either edit .desktop in autostart or add in GUI):

`xkbcomp $HOME/.xkbmap ":0"`

A last possibility is to run `speedswapper.sh` at startup.
