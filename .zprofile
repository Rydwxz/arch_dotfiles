env EDITOR="~/.local/share/nvim"

env PATH=$PATH:~/usr
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
exec startx
# exec sway
fi
