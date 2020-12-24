#!/bin/sh

_s() {
	printf " space: "
	df -h /dev/sda6 | tail -n 1 | awk '{ print $3 }'
}

printf "current"
_s

echo "vrooming..."
rm -rf ~/.cache
rm -rf ~/Downloads
rm -rf ~/Desktop
rm -rf ~/ss/*
rm -rf ~/.Xauthority
rm -rf ~/.node_repl_history
rm -rf ~/.wget-hsts

sudo pacman --noconfirm -Scc >/dev/null 2>&1
sudo rm -rf /var/cache/pacman/pkg/*

b="$(pacman -Qtdq)"
[ -n "$b" ] && {
	sudo pacman --noconfirm -Rns "$b" >/dev/null 2>&1
}

printf "new"
_s
