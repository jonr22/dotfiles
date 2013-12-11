#!/bin/zsh

if [ -n "$1" ]; then
  SESSION=$1
else
  SESSION=$USER
fi

tmux new-session -s $SESSION -d

tmux rename-window scratch

tmux split-window -v -p 25
tmux split-window -h

tmux select-pane -t 0
tmux split-window -h -p 25 -d

tmux new-window -n main
tmux split-window -v
tmux select-window -t 1

