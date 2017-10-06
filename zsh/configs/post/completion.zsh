# load our own completion functions
fpath=($ZSH/completions /usr/local/share/zsh/site-functions $fpath)

# completion
autoload -U compinit
compinit
bashcompinit
