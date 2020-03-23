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

If xmodmap and xdg-autostart are available:

`cp ~/dotfiles/setup/speedswapper.desktop ~/.config/autostart/speedswapper.desktop`

 Another possibility for Ubuntu (and other systems using xkb instead of xmodmap), run

`xmodmap ~/dotfiles/setup/speedswapper`

`xkbcomp $DISPLAY $HOME/.xkbmap`

Then add the following to "Startup Applications" meu:

`xkbcomp ~/.xkbmap ":0"`
