export TERM="xterm-256color"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

autoload -Uz compinit
compinit

source /usr/share/nvm/init-nvm.sh
source $HOME/.cargo/env

export PATH="/home/safin/.deno/bin:/home/safin/Documents/vault:/usr/local/bin/trck:$PATH"

alias mirror='xrandr --output DP-1 --auto --same-as eDP-1 && killall polybar && bash ~/.config/polybar/launch.sh'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l --icons'
alias lal='exa -l -a --icons'
alias lbuilda="go build -ldflags '-s -w ' -o ./aeacus ./src; go build -ldflags '-w -s' -tags phocus -o  ./phocus ./src"
alias wbuilda="GOOS=windows go build -ldflags '-s -w ' -o ./aeacus.exe ./src; GOOS=windows go build -ldflags '-w -s' -tags phocus -o ./phocus.exe ./src"

eval "$(starship init zsh)"
