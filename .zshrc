if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source <(antibody init)
export TERM="xterm-256color"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000

autoload -Uz compinit
compinit

antibody bundle < ~/.config/antibody/zsh_plugins.txt
[[ ! -f ~/.config/antibody/p10k.zsh ]] || source ~/.config/antibody/p10k.zsh 

source /usr/share/nvm/init-nvm.sh
source $HOME/.cargo/env
export DENO_INSTALL="/home/safin/.deno"
export PATH="$DENO_INSTALL/bin:/home/safin/Documents/vault:$PATH"

alias mirror='xrandr --output DP-1 --auto --same-as eDP-1 && killall polybar && polybar &'
alias ls='exa --icons'
alias la='exa -a --icons'
alias ll='exa -l --icons'
alias lal='exa -l -a --icons'
alias lbuilda="go build -ldflags '-s -w ' -o ./aeacus ./src; go build -ldflags '-w -s' -tags phocus -o  ./phocus ./src"
alias wbuilda="GOOS=windows go build -ldflags '-s -w ' -o ./aeacus.exe ./src; GOOS=windows go build -ldflags '-w -s' -tags phocus -o ./phocus.exe ./src"
