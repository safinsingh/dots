#!/bin/sh

dots="$HOME/dots/"

#raw
_r() {
	d=$(dirname "${dots}${1}")
	mkdir -p "$d"
	cp -Rf "$1" "$d"
}

_rd() {
	rm -rf "${dots}${1}"
}

#home
_() {
	d=$(dirname "${dots}home${1}")
	mkdir -p "$d"
	cp -Rf "${HOME}${1}" "$d"
}

_d() {
	rm -rf "${dots}home${1}"
}

#cleanup
_rd "/*"
_d "/*"

#home
_ "/.zshrc"
_ "/.Xresources"
_ "/.gitconfig"
_ "/.editorconfig"
_ "/.prettierrc"
_ "/.bin"
_ "/.wp"
_ "/.config/bspwm"
_ "/.config/sxhkd"
_ "/.config/alacritty"
_ "/.config/picom"
_ "/.config/rofi"
_ "/.config/nvim"
_ "/.config/dunst"

#sys
_r "/etc/X11/xorg.conf.d/30-touchpad.conf"
_r "/etc/systemd/logind.conf"
_r "/etc/ly/config.ini"

#rms
_d "/.config/nvim/plugged"

#push
cd "$HOME/dots" && p
