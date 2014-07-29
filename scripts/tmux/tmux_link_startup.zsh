TMUX_SESSIONS=('terminal')
TMUX_SCRIPT_LOCATION=${TMUX_SCRIPT_LOCATION:-$TMUX_DEVELOPER_DIR/bin/tmux}

### Setup Sessions ###

for s in $TMUX_SESSIONS; do
  if ! tmux has-session -t "$s"; then
      source "${TMUX_SCRIPT_LOCATION}/${s}.zsh"
  fi
done
