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

### tmux
Install `tmux` then create config symlink by `ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf`

### i3
Install `i3-gaps`, `dmenu`, `i3status`, `feh`, `picom`, `alacritty`, `lightdm-gtk-greeter-settings`
```
ln -s ~/dotfiles/i3/config ~/.config/i3/config
ln -s ~/dotfiles/i3/i3status ~/.config/i3status/config
cp ~/dotfiles/i3/plasma-custom-i3.service ~/.config/systemd/user/plasma-custom-i3.service
cp ~/dotfiles/i3/.fehbf ~/.fehbg
ln -s ~/dotfiles/i3/alacritty.yml ~/.config/alacritty/alacritty.yml
systemctl --user mask plasma-kwin_x11.service
systemctl daemon-reload
systemctl --user enable plasma-custom-i3.service
```
In `/etc/lightdm/lightdm.conf`, set lightdm-gtk-greeter as greeter-session.
Set lock screen wallpaper using lightdm-gtk-greeter-settings where the pic must be in /usr/share/pixmaps
Then,
```
sudo systemctl disable sddm -f
sudo systemctl enable lightdm -f
```

## ranger
Install `ranger` and `w3m`
```
ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger
ln -s ~/dotfiles/ranger/rifle.conf ~/.config/ranger
```

## Key remap
Set
```
XKBOPTIONS="caps:escape"
```
in `/etc/keyboard`.

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
