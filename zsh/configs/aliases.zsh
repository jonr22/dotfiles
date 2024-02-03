# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'
alias d='dirs -v | head -10'

# Basic directory operations
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

# List direcory contents
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# pretty print the path
alias path='echo -e ${PATH//:/"\n"}'

# Extras
alias tlf='tail -f'
alias mkdir='mkdir -p'

# Fun
alias weather='curl wttr.in/Hingham'
alias myip='curl https://ipinfo.io/ip'


alias -g G='| grep'
alias -g GV='| grep -v'
alias -g L='| less'
alias -g LL="2>&1 | less"
alias -g C='| wc -l'
alias -g S='| sort'
alias -g H='| head'
alias -g T='| tail'
alias -g N="> /dev/null"
alias -g NN="> /dev/null 2>&1"
alias -g NE="2> /dev/null"
