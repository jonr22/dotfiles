[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3
exec xbindkeys
