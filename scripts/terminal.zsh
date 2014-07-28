#!/bin/zsh

### Create Session ###
#
if [ -n "$1" ]; then
  SESSION=$1
else
  SESSION='terminal'
fi

tmux new-session -s $SESSION -d


### Terminal Window 1 ###

tmux rename-window t1
tmux split-window -v
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 1
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 0


### Terminal Window 2 ###

tmux new-window -n t2
tmux split-window -v
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 1
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ~; clear"
tmux clear-history

tmux select-pane -t 0


### Select Start Window ###

tmux select-window -t 1

