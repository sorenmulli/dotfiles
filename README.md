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
Run `zinstall` for plugin install.

### Python
Installation:
```
vpython="3.9.0"; mvpython="3.9"
sudo pacman -S tk
wget https://www.python.org/ftp/python/$vpython/Python-$vpython.tar.xz
tar xf Python-$vpython.tar.xz
cd Python-$vpython
sudo ./configure --enable-optimizations --enable-shared
sudo make altinstall
/usr/local/bin/pip$mvpython install wheel virtualenv
virtualenv --python=python$mvpython ~/.venv
```
Restart shell, then
```
pip install --upgrade pip
pip install -r ~/dotfiles/python/requirements.txt
```

### VIM

Install `neovim` and `xsel` from package man.

Run `:PlugInstall` for plugin install.
Setup `YouCompleteMe` by 
`
cd ~/.vim/plugged/YouCompleteMe
python install.py --clang-completer
`

### konsole
`ln -s ~/dotfiles/konsole/WhiteOnBlack.colorscheme ~/.local/share/konsole/WhiteOnBlack.colorscheme`

`ln -s ~/dotfiles/konsole/Shell.profile ~/.local/share/konsole/Shell.profile`

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

Actually works: 
https://superuser.com/a/1239550
