# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

# Setup base16 colors
if [ -f ~/.zsh-base16 ]; then
  source ~/.zsh-base16
fi
