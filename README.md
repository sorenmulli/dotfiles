# My configuration


## Setup:

Clone to `~/`

### zsh

`zsh` package from package man.

`antibody` from AUR or install from [releases page](https://github.com/getantibody/antibody/releases)

Run

`echo "ZDOTDIR=$HOME/dotfiles/zsh" > ~/.zshenv`

then 

`chsh -s $(which zsh)`

Reboot for `chsh` to take effect.
Run `zinstall` for plugin install.

### Python
Install `pyenv`, `pyenv-virtualenv`, then `pyenv install 3.9.?` and `pyenv virtualenv 3.9.? day2day39` and `pyenv global day2day39`.
Restart shell, then
```
pip install --upgrade pip
pip install -r ~/dotfiles/python/requirements.txt
```

### (neo)vim
Install `neovim` and `xsel` from package man.

### tmux
Install `tmux` then create config symlink by `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

### i3
Install `i3-gaps`, `dmenu`, `i3status`, `feh`, `picom`
```
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/i3/i3status ~/.config/i3status/config
ln -s ~/dotfiles/i3/plasma-i3.desktop /usr/share/xsessions/plasma-i3.desktop
```

## ranger
Install `ranger` and `w3m`
```
ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger
ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger
```

### Key remap
Add 
```
Option "XkbOptions" "caps:swapescape"
```
to  `/etc/X11/xorg.conf.d/00-keyboard.conf`

