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
alias i="sudo pacman -S"
alias up="sudo pacman -Syyu"


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