#shell options
set -k
setopt auto_cd
setopt extendedglob
setopt notify

unsetopt PROMPT_SP
unsetopt beep
bindkey -e

#vars
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
export BROWSER="firefox"
export TERM="xterm-256color"

export PATH="/home/pdx/.bin:$PATH"
export PATH="/home/pdx/.deno/bin:$PATH"
export PATH="/home/pdx/.cargo/bin:$PATH"
export PROMPT='%F{red}%B*%b%f '

#aliases
alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"

#file manipulation
alias grep="grep --color=auto"
alias vim="nvim"

#disk
alias space="sudo du -sh / 2>/dev/null"

#screen
alias record="scr -c -e -r60 2>/dev/null"
alias mirror="xrandr --output DP-1 --auto --same-as eDP-1"
alias xwin="Xephyr -br -ac -noreset -screen 1600x900 :2"
alias bigxwin="Xephyr -br -ac -noreset -screen 1920x1080 :2"
alias xdisp="DISPLAY=:2"
