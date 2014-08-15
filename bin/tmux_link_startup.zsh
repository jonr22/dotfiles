TMUX_SESSIONS=('terminal' 'weechat')
# TMUX_SCRIPT_LOCATION=${TMUX_SCRIPT_LOCATION:-$TMUX_BIN_DIR}

### Setup Sessions ###

for s in $TMUX_SESSIONS; do
  if ! tmux has-session -t "$s"; then
      # source "${TMUX_SCRIPT_LOCATION}/tmux_${s}"
      eval "tmux_${s}"
  fi
done
