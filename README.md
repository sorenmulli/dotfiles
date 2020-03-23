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


### Key remap
Run (for change of ESC and Caps Lock)

This might work: 

`cp ~/dotfiles/setup/speedswapper.desktop ~/.config/autostart/speedswapper.desktop`


 Another possibility is the more stable xkb. For this, run

`xmodmap ~/dotfiles/setup/speedswapper`

`xkbcomp $DISPLAY $HOME/.xkbmap`

Then make the following run on startup (either edit .desktop in autostart or add in GUI):

`xkbcomp $HOME/.xkbmap ":0"`
