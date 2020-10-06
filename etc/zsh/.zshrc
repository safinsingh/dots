export LANG=en_US.UTF-8

## init
# source env vars
source /etc/zsh/zshenv

# reload x colors
xrdb -load "${XDG_CONFIG_HOME}x/xresources"

# set shell options
set -k
setopt auto_cd
setopt extendedglob
setopt notify

unsetopt PROMPT_SP
unsetopt beep

## aliases
# x
alias mirror="xrandr --output DP-1 --auto --same-as eDP-1"
alias xwin="Xephyr -br -ac -noreset -screen 1600x900 :2"
alias bigxwin="Xephyr -br -ac -noreset -screen 1920x1080 :2"
alias xdisp="DISPLAY=:2"

# files
alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"
alias bat="bat --theme base16"
alias space="df -h /dev/sda6"

# screen capturing
alias record="scr -m s -f 60 -c -n"
alias scrot="maim $(date '+%s').png"

# colors
alias grep="grep --color=auto"
alias ip="ip -color=auto"

# programs
alias git="hub"
alias vim="nvim"
alias v="nvim"
alias gpg="gpg2"
alias nodenv="source /usr/share/nvm/init-nvm.sh"

# configs
alias vconf="cd $XDG_CONFIG_HOME/nvim && nvim init.vim"

## prompt
export PROMPT='%B%F{black}卑%1~%f%b '
source ~/.zsh/prompt.zsh

## start
cd /home
clear && trifetch
