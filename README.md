# My configuration


## Setup:

Clone to `~/`

### zsh

`zsh` package from package man.

`git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote`

Run

`echo "ZDOTDIR=$HOME/dotfiles/zsh" > ~/.zshenv`

then 

`chsh -s $(which zsh)`

Reboot for `chsh` to take effect.

### Python
Install `pyenv`, `pyenv-virtualenv`, then `pyenv install 3.11` and `pyenv virtualenv 3.11 day2day311` and `pyenv global day2day311`.
Restart shell, then
```
pip install --upgrade pip pip install -r ~/dotfiles/python/requirements.txt
```

### (neo)vim
Install `neovim` and `xsel` from package man.

node and npm are required for coc.nvim which needs symlink
```
ln -s ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json
```

On first open, after pluginstall, run 
```
:CocInstall coc-pyright
```

### tmux
Install `tmux` then create config symlink by `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

### i3
Install `i3`, `i3status`, `feh`, `picom`, `rofi`, `rofi-calc`
```
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/i3/i3status ~/.config/i3status/config
cp ~/dotfiles/i3/.fehbf ~/.fehbg
```
Now remove `xfwm4` and `xfdesktop` from autostart and add `i3` and `xfce4-panel`.
Remove all xfce keyboard shortcuts


## ranger
Install `ranger` and `w3m`
```
ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger
ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger
```

## Key remap
Set
```
XKBOPTIONS="caps:swapescape"
```
in `/etc/default/keyboard`.

Or (previously)
Add 
```
Option "XkbOptions" "caps:swapescape"
```
to  `/etc/X11/xorg.conf.d/00-keyboard.conf`

## GitHub access

```
ssh-keygen -t ed25519 -C "swholm@protonmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```
Insert into https://github.com/settings/ssh/new 
