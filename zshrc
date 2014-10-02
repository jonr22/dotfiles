### Vars ###

ZSH=~/.zsh



### Functions ###

for function in $ZSH/functions/*; do
  source $function
done



### Auto Complete ###

# add a function path
fpath=($ZSH/completions $fpath)

# load and run compinit
autoload -U compinit
compinit

# selection options
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

# highlight and select from colored menu
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-colors ''

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/



### Theme ###

# prompt
setopt promptsubst
source "$ZSH/theme"

# colors
autoload -U colors
colors
# export CLICOLOR=1

# Setup base16 colors
if [ -f ~/.zsh-base16 ]; then
  source ~/.zsh-base16
fi



### History ###

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096



### CD Behavior ###

setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch



### Bindings ###

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
bindkey "[Z" reverse-menu-complete



### ZSH Aliases ###

alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'



### Shared Settings ###

# Run env commands if they exist
if [ -f ~/.env ]; then
  source ~/.env
fi

# Run alias commands if they exist
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi
