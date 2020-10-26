# shell options
set -k
setopt auto_cd
setopt extendedglob
setopt notify

unsetopt PROMPT_SP
unsetopt beep
bindkey -e

# vars
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="brave"
export TERM="xterm-256color"

export PATH="/home/safin/.bin:$PATH"

# prompt
export PROMPT="%B%F{cyan}$%f%b %1~ "

# aliases
alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"

alias grep="grep --color=auto"
alias vim="nvim"

alias space="df -h /dev/sda6"

alias record="scr -m s -f 60 -c -n"
alias scrot="maim $(date '+%s').png"
alias s="sleep 3 && maim ~/rice.png && notify-send \"screenshot taken!\""

alias mirror="xrandr --output DP-1 --auto --same-as eDP-1"
alias xwin="Xephyr -br -ac -noreset -screen 1600x900 :2"
alias bigxwin="Xephyr -br -ac -noreset -screen 1920x1080 :2"
alias xdisp="DISPLAY=:2"

alias nodenv="source /usr/share/nvm/init-nvm.sh"

# sources
source ~/.cargo/env

clear && f
