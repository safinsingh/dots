export TERM="xterm-256color"

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
export PATH="/home/safin/.deno/bin:/home/safin/Documents/vault:/usr/local/bin/trck:/opt/Discord/:/home/safin/dots/scripts:/home/safin/go/bin:/opt/android-sdk/tools/bin/:$ANDROID_HOME/emulator/:$ANDROID_HOME/platform-tools/:$ANDROID_HOME/tools/bin/:$ANDROID_HOME/tools/:$ANDROID_HOME/emulator:/home/safin/.nvm/versions/node/v14.5.0/pnpm-global/4/node_modules/strap-cli/build:$PATH"

alias mirror='xrandr --output DP-1 --auto --same-as eDP-1 && killall polybar && bash ~/.config/polybar/launch.sh'
alias fetch='/home/safin/Downloads/rsfetch -P -d -H -w -U -t -s -r'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l -a --icons'
alias tree='exa -a --icons --tree'
alias g='git'
alias gcl='git clone'
alias gignore='git rm -r --cached . && git add .'
alias npm='pnpm'
alias strap get='strap.js'
mkcd() { mkdir -p "$1" && cd "$1"; }

eval "$(starship init zsh)"
