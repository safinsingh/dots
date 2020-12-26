#!/bin/bash

help='s v0.1

USAGE:
	s [-u/-d/-h]

FLAGS:
	u, -u, --up		- increase the volume by 5%
	d, -d, --down	- decrease the volume by 5%
	h, -h, --help	- display this help message
'

[ -z "$1" ] && {
	printf '%s' "$help"
	exit 1
}

new="+"
case $1 in
u | -u | --up) ;;
d | -d | --down)
	new="-"
	;;
h | -h | --help)
	printf '%s' "$help"
	exit 0
	;;
esac

pactl set-sink-volume 0 "${new}5%"

icon="奔"
[ "$new" = "+" ] && icon="墳"

notify-send "${icon} $(pamixer --get-volume)%" \
	-h string:x-canonical-private-synchronous:vol
