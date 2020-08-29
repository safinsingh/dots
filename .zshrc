export TERM="xterm-256color"
xrdb -load ~/.Xresources

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

autoload -Uz compinit
compinit

source /usr/share/nvm/init-nvm.sh
source $HOME/.cargo/env
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export SCR_DIR='/home/safin/Documents/scr/img'
export REC_DIR='/home/safin/Documents/scr/vid'
export PATH="/home/safin/Documents/vault:/home/safin/dots/scripts/minfetch:/home/safin/dots/scripts:/home/safin/go/bin:$PATH"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias mirror='xrandr --output DP-1 --auto --same-as eDP-1'
alias fetch='/home/safin/Downloads/rsfetch -P -d -H -w -U -t -s -r'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l -a --icons'
alias tree='exa -a --icons --tree'
alias g='git'
alias gcl='git clone'
alias gignore='git rm -r --cached . && git add .'
alias npm='pnpm'
alias cat='bat'
alias xwin='Xephyr -br -ac -noreset -screen 1600x900 :2'
alias xdisp='DISPLAY=:2'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias record='scr -m s -f 60 -c -n'
alias git='hub'

aegis() {
  cd /home/safin/Documents/aeacus/

  cp /home/safin/Documents/vault/ca-crypto.go cmd/crypto.go

  make release
  unzip aeacus-win32.zip 1>/dev/null
  unzip aeacus-linux.zip 1>/dev/null

  7z a -y -bsp0 -bso0 -mx=9 -mfb=273 -ms=on aeacus-win32.7z aeacus-win32/ &>/dev/null
  7z a -y -bsp0 -bso0 -mx=9 -mfb=273 -ms=on aeacus-linux.7z aeacus-linux/ &>/dev/null

  rm -rf aeacus-win32/
  rm -rf aeacus-linux/

  rm -rf aeacus-win32.zip
  rm -rf aeacus-linux.zip

  git reset --hard HEAD
  notify-send "Aeacus builds finished!"
}

mkcd() {
  mkdir -p "$1"
  cd "$1"
}

precmd() $funcstack[1]() echo

eval "$(starship init zsh)"
