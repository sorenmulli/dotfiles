# Lines configured by zsh-newuser-install
HISTSIZE=2000
SAVEHIST=3000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sorenwh/.zshrc'

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
#aliases
if [ -f ~/dotfiles/zsh/.zsh_aliases ];then
. ~/dotfiles/zsh/.zsh_aliases
fi

#My binaries 
export PATH="$PATH:/home/sorenwh/.sorenbin/bin"
export PYTHONPATH="${PYTHONPATH}:/home/sorenwh/Nextcloud/semester4/reinforcement/opg/02465students"
export VISUAL=vim
export EDITOR="$VISUAL"

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

setopt AUTO_CD
setopt PUSHDMINUS


source ~/dotfiles/zsh/.zsh_plugins.sh
