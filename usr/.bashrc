# sources
source $HOME/.cargo/env

# vars
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export PATH="/home/safin/.bin:$PATH"
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="brave"

# prompt
export PS1="\e[1m\e[36m$\e[0m \W "

# aliases
alias vim="nvim"
alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"
alias space="df -h /dev/sda6"
alias record="scr -m s -f 60 -c -n"
alias grep="grep --color=auto"
alias scrot="maim $(date '+%s').png"
alias mirror="xrandr --output DP-1 --auto --same-as eDP-1"
alias xwin="Xephyr -br -ac -noreset -screen 1600x900 :2"
alias bigxwin="Xephyr -br -ac -noreset -screen 1920x1080 :2"
alias xdisp="DISPLAY=:2"
alias nodenv="source /usr/share/nvm/init-nvm.sh"
alias dotty='dotty --dot-dir=$HOME/dot'
