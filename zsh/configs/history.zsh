# setopt hist_ignore_all_dups share_history
setopt hist_ignore_all_dups
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"
