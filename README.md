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

Run (for change of ESC and Caps Lock)

`echo "xmodmap ~/dotfiles/vim/speedswapper" >> ~/.Xresources`

Set terminal to solarized.

Run `:PlugInstall` for plugin install.


