# Zsh prompt
PS1='%/ $ '

# XDG standard directory declarations
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_RUNTIME_DIR="$HOME/run/user/$UID"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_VIDEOS_DIR="$HOME/Movies"

#!/bin/zsh source
source "$HOME/.iterm2_shell_integration.zsh"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME"
setopt nocaseglob

# exports
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export BROWSER="safari"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export EDITOR="nvim"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO="$XDG_DATA_HOME"/terminfo                                                                         
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo  
export TLDR_CACHE_DIR="$XDG_CACHE_HOME"/tldr
export VISUAL="$EDITOR"
export W3M_DIR="$XDG_DATA_HOME"/w3m
export ZDOTDIR="$HOME"/.config/zsh

# aliases
alias love="/Applications/love.app/Contents/MacOS/love"
alias ls='eza'
alias neofetch='fastfetch'
alias vi='nvim'
alias vim='nvim'
alias adb='HOME="$XDG_DATA_HOME"/android adb'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
eval $(thefuck --alias)

# Brew shell completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Zsh Vim mode
bindkey -v

# Enable blinking cursor
echo -ne '\e[?12;25h'

# Set up block cursor for insert mode
function zle-line-init zle-keymap-select {
    if [[ $KEYMAP == vicmd ]]; then
        echo -ne '\e[2 q' # Block cursor for normal mode
    else
        echo -ne '\e[5 q' # Line cursor for insert mode
    fi
}
zle -N zle-line-init
zle -N zle-keymap-select

# Ensure the cursor is set correctly when starting Zsh
precmd() { zle-line-init }

ranger
