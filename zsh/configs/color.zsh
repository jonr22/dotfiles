# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc. on FreeBSD-based systems
export CLICOLOR=1

BASE16_THEME_FILE="$HOME/.base16/${BASE16_COLOR_THEME:-base16-tomorrow-night}.sh"

# Setup base16 colors
if [ -f $BASE16_THEME_FILE ]; then
  source $BASE16_THEME_FILE
fi
