TMUX_WINDOWS=('terminal:t1' 'terminal:t2' 'weechat:irc')


### Link Windows ###

for w in $TMUX_WINDOWS; do
  tmux link-window -s "$w"
done
