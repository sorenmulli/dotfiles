# My configuration


## Setup:

Clone to `~/`

### ZSH

`zsh` package from package man.

`antigen-git` or `zsh-antigen` from package man.

Run
`echo "ZDOTDIR=$HOME/dotfiles/zsh" > .zshenv`
then 
`chsh -s $(which zsh)`

Reboot for `chsh` to take effect.
Run `antiplug` for plugin install.

### VIM

Install `gvim` from package man.

Run (for change of ESC and Caps Lock)
`echo "xmodmap ~/dotfiles/vim/speedswapper" >> .xinitrc`

Set terminal to solarized.

Run `:PlugInstall` for plugin install.


