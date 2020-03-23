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

If `.xinitrc` is ran at startup (not in Ubuntu):

`echo -e "xmodmap ~/dotfiles/vim/speedswapper\n$(cat ~/.xinitrc)" > ~/.xinitrc`

For Ubuntu, run

`xmodmap ~/dotfiles/vim/speedswapper`

`xkbcomp $DISPLAY $HOME/.xkbmap`

Then add the following to "Startup Applications" meu:

`xkbcomp ~/.xkbmap ":0"`
