# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="../../.zsh_themes/simple"
# ZSH_THEME="blinks"
# ZSH_THEME="dst"
# ZSH_THEME="tjkirch"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"
ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
if [ $(uname) = Darwin ]; then
  plugins=(git rails ruby rvm bundler gem github tmux node npm python pip heroku vagrant osx brew virtualenv virtualenvwrapper)
else
  plugins=(git rails ruby rvm bundler gem github tmux node npm python pip nvm virtualenv virtualenvwrapper)
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

setopt auto_cd

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# shift-tab reverses menu completion
bindkey "[Z" reverse-menu-complete

# use incremental search
bindkey "^R" history-incremental-search-backward

# Run env commands if they exist
if [ -f ~/.env ]; then
  source ~/.env
fi

# Run alias commands if they exist
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

