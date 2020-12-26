#!/bin/bash

help='l v0.1

USAGE:
	l [-u/-d/-h]

FLAGS:
	u, -u, --up		- increase the brightness by 5%
	d, -d, --down	- decrease the brightness by 5%
	h, -h, --help	- display this help message
'
current=$(xrandr --current --verbose | grep -w "Brightness" | head -n 1 | cut -d" " -f2)

[ -z "$1" ] && {
	printf '%s' "$help"
	exit 1
}

run() {
	[ "$(echo "$1 > 1" | bc)" = "1" ] && exit 1
	xrandr --output eDP-1 --brightness $1
	notify-send "brightness: $(echo "$1 * 100" | bc | cut -d. -f1)%" \
		-h string:x-canonical-private-synchronous:brightness
}

case $1 in
u | -u | --up)
	new="$(echo "$current + 0.05" | bc)"
	run "$new"
	;;
d | -d | --down)
	new="$(echo "$current - 0.05" | bc)"
	run "$new"
	;;
h | -h | --help)
	printf '%s' "$help"
	exit 0
	;;
esac
