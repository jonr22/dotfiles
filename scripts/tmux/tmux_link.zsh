TMUX_WINDOWS=('terminal:t1' 'terminal:t2' 'irssi:irc')


### Link Windows ###

for w in $TMUX_WINDOWS; do
  tmux link-window -s "$w"
done
