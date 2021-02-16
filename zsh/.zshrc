# VI mode
bindkey -v

##### COMP AND PROMPT
zstyle :compinstall filename $HOME/dotfiles/zsh/.zshrc
autoload -Uz compinit promptinit
compinit
promptinit

#### HISTORY
HISTSIZE=10000
SAVEHIST=10000

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

##### PATH
# Additions to PATH is dependant on whether on job or home
if [ -d $HOME/jobxx ]; then
    source $HOME/dotfiles/zsh/ji_path.sh
else
    source $HOME/dotfiles/zsh/home_path.sh
fi

#### COMPLETION
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
setopt COMPLETE_ALIASES
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

#### CD and prompt niceness
setopt AUTO_CD
setopt PUSHDMINUS
#Quick access to school subjects
cdpath=$HOME/Nextcloud/semester6
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
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
# create a widget from `my-accept-line' with the same name
zle -N my-accept-line
zle -N zle-keymap-select
# rebind Enter, usually this is `^M'
bindkey '^M' my-accept-line
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(my-accept-line)

#### EDITOR
export VISUAL=nvim
export EDITOR="$VISUAL"
export VIMINIT='source $MYVIMRC'
export MYVIMRC="$HOME/dotfiles/vim/.vimrc"

#### PYTHON
export PYTHONBREAKPOINT='ipdb.set_trace'
export PYTHONPATH=$PYTHONPATH:~/Nextcloud/absis/pyaccount
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/lib:/usr/lib:/usr/local/lib

# Python environment
if [ -d "$HOME/.venv/" ]; then
    source $HOME/.venv/bin/activate
fi

#### TEX
export TEXINPUTS='.:~/Nextcloud/Software/LaTeX/EndLosung:'

#### ALIAS
source ~/dotfiles/zsh/.zsh_aliases

#### PLUGINS AND COMMANDS
# compatability functions for ohmyzsh plugs
source ~/dotfiles/zsh/.ohmyzsh_compat
# My CLI functions
source ~/dotfiles/zsh/myfuncs.sh
# Plugins
source ~/dotfiles/zsh/.zsh_plugins.sh
