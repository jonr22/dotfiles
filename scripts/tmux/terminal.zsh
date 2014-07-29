#!/bin/zsh

WINDOW_SESSION='terminal'
TMUX_DEVELOPER_DIR=${TMUX_DEVELOPER_DIR:-$HOME/Developer}


### Create Session ###
echo "creating session (${WINDOW_SESSION})"

tmux new-session -s ${WINDOW_SESSION} -d


### Terminal Window 1 ###
echo "creating t1 window (${WINDOW_SESSION})"

tmux rename-window t1
tmux split-window -v
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 1
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 0


### Terminal Window 2 ###
echo "creating t2 window (${WINDOW_SESSION})"

tmux new-window -n t2
tmux split-window -v
tmux split-window -h

tmux select-pane -t 0
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 1
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 2
tmux send-keys "cd ${TMUX_DEVELOPER_DIR}; clear"
tmux clear-history

tmux select-pane -t 0


### Select Start Window ###

tmux select-window -t 1

