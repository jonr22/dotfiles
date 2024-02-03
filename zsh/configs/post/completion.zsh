# load our own completion functions
fpath=($ZSH/completions /usr/local/share/zsh/site-functions $fpath)

if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
  fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fi

# completion
autoload -U compinit
compinit
# bashcompinit
