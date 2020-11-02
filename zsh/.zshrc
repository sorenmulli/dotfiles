# Lines configured by zsh-newuser-install
HISTSIZE=2000
SAVEHIST=3000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sorenwh/dotfiles/zsh/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall

#
# Copied from bashrc
#

#Don't do anything in non-interactive
[[ $- != *i* ]] && return

#A lot of standard Manjaro settings about colours
. ~/dotfiles/zsh/.manjaro_standard

if [ -d "/home/swho/jobxx" ]; then
    export PATH=/home/swho/bin:/home/swho/.local/bin:/home/perl/bin:/home/swho/dev-utils/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/swho/jobxx/bin:/home/swho/.fzf/bin:$PATH
#My binaries
else
    #Anaconda settings
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/sorenwh/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/sorenwh/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/sorenwh/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/sorenwh/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi 
# Function for enter on empty line https://stackoverflow.com/questions/30169090/zsh-behavior-on-enter
my-accept-line () {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next
        # to the prompt
        echo
        # check if inside git repository
        if git rev-parse --git-dir > /dev/null 2>&1 ; then
            # if so, execute `git status'
            git status
        else
            # else run `ls'
            ls --color=auto
        fi
    fi
    # in any case run the `accept-line' widget
    zle accept-line
}


#History
HISTFILE=~/dotfiles/zsh/.histfile
PROMPT_COMMAND='history -a'

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

#compatability functions for ohmyzsh plugs
. ~/dotfiles/zsh/.ohmyzsh_compat

#aliases
if [ -f ~/dotfiles/zsh/.zsh_aliases ];then
. ~/dotfiles/zsh/.zsh_aliases
fi

#Vim stuff
export VISUAL=nvim
export EDITOR="$VISUAL"
export VIMINIT='source $MYVIMRC'
export MYVIMRC="~/dotfiles/vim/.vimrc"

#Python stuff
export PYTHONBREAKPOINT='ipdb.set_trace'
export PYTHONPATH=$PYTHONPATH:~/Nextcloud/maijo/main
#TeX stuff
export TEXINPUTS='.:~/Nextcloud/Software/LaTeX/EndLosung:'

#Completion
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

#Cd
setopt AUTO_CD
setopt PUSHDMINUS

# create a widget from `my-accept-line' with the same name
zle -N my-accept-line
# rebind Enter, usually this is `^M'
bindkey '^M' my-accept-line
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(my-accept-line)

#Plugins
source ~/dotfiles/zsh/.zsh_plugins.sh

#My CLI functions
source ~/dotfiles/zsh/myfuncs

#Quick access to school subjects
cdpath=$HOME/Nextcloud/semester5

