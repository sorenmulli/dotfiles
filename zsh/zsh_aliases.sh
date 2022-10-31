# Install zsh plugins
alias zinstall="antibody bundle < ~/dotfiles/zsh/zsh_plugins.txt > ~/dotfiles/zsh/.zsh_plugins.sh"

# Standard programs
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkd="mkdir -pv" \
    ls="ls --color=auto"

# Config
alias \
    zrc='$EDITOR ~/dotfiles/zsh/.zshrc'\
    zplug='$EDITOR ~/dotfiles/zsh/.zsh_plugins.txt'\
    zalias='$EDITOR ~/dotfiles/zsh/.zsh_aliases'\
    vimrc='$EDITOR ~/dotfiles/vim/.vimrc'

# Paths
alias \
    n="cd $HOME/Nextcloud"\
    h="cd $HOME"

# Useful programs and shorthands
alias \
    nv="$EDITOR ."\
    x="xdg-open . > /dev/null 2>&1"


uge()       {curl -s https://ugenr.dk/ | grep -o -P -m 1 '(?=Uge).*(?=starter)';}
vgdiff()    {nvim -p $(git ls-files -o -m --exclude-standard);}
nf()        { fzf | xargs -r -I % $EDITOR %; }
xo()        { xdg-open $1 > /dev/null 2>&1}
