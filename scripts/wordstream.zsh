#!/bin/zsh

### Set Config ###

if [ -n "$1" ]; then
  SESSION=$1
else
  SESSION='wordstream'
fi

if [ -n "$2" ]; then
  TERMINAL_SESSION=$2
else
  TERMINAL_SESSION='terminal'
fi


### Setup Terminal Session ###

if ! tmux has-session -t "$TERMINAL_SESSION"; then
    ~/terminal.zsh $TERMINAL_SESSION
fi


### Create Session ###

tmux new-session -s $SESSION -d


### dev ###

tmux rename-window dev
tmux split-window -v -p 25
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history
tmux send-keys "vim ."

tmux select-pane -t 1
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history

tmux select-pane -t 0


### servers ###

tmux new-window -n servers
tmux split-window -v

tmux select-pane -t 0
tmux send-keys "cd ~WS_REPO/server/wordstream/src; clear"
tmux clear-history
tmux send-keys "python server.py"

tmux select-pane -t 1
tmux send-keys "cd ~WS_REPO/client/manager/src; clear"
tmux clear-history
tmux send-keys "python server.py"

tmux select-pane -t 0


### scratch ###

tmux new-window -n scratch
tmux split-window -v
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history

tmux select-pane -t 1
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ~WS_REPO; clear"
tmux clear-history

tmux select-pane -t 0


### Link Terminal Windows ###

# tmux link-window -s $TERMINAL_SESSION:t1
# tmux link-window -s $TERMINAL_SESSION:t2
tmux link-window -s terminal:t1
tmux link-window -s terminal:t2


### Select Start Window ###

tmux select-window -t 1

