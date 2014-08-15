#!/bin/zsh

WINDOW_SESSION='irssi'


### Create Session ###
echo "creating session (${WINDOW_SESSION})"

tmux new-session -s ${WINDOW_SESSION} -d


### irssi window ###
echo "creating irc window (${WINDOW_SESSION})"

tmux rename-window irc
tmux split-window -h -l 20

tmux select-pane -t 0
tmux send-keys "cd $HOME; clear"
tmux clear-history
tmux send-keys "irssi"

tmux select-pane -t 1
tmux send-keys "cd $HOME; clear"
tmux clear-history
tmux send-keys "perl $HOME/.irssi/scripts/autorun/adv_windowlist.pl"

tmux select-pane -t 0
