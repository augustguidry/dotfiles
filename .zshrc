# August Guidry's Zsh config

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select                # autocompletion with an arrow-key driven interface
zstyle ':completion::complete:' gain privileges 1 # enable autocompletion of privileged environments in privileged commands

# prompt
PS1='%/ $ '

# EXPORTS
export BROWSER="librewolf"
export EDITOR="nvim"
export VISUAL="nvim"

# aliases
alias grep='grep --color=auto'
alias ls='eza'
alias neofetch='fastfetch'
alias vi='nvim'
alias vim='nvim'

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
  case $KEYMAP in
    vicmd) echo -n '\e[1 q';;       # block
    viins|main) echo -ne '\e[5 q';; # beam
  esac
}
zle -N zle-keymap-select
  zle-line-init() {
  zle -K viins #initiate 'vi insert' as keymap (can be removed if 'bindkey -V' has been set elsewhere).
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

startx
