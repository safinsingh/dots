# x
alias mirror="xrandr --output DP-1 --auto --same-as eDP-1"
alias xwin="Xephyr -br -ac -noreset -screen 1600x900 :2"
alias xdisp="DISPLAY=:2"

# files
alias ls="exa --icons --group-directories-first"
alias la="exa -a --icons --group-directories-first"
alias ll="exa -l -a --icons --group-directories-first"
alias tree="exa -a --icons --tree --group-directories-first"
alias bat="bat --theme base16"

# screen capturing
alias record="scr -m s -f 60 -c -n"
alias scrot="scr -S"

# colors
alias grep="grep --color=auto"
alias ip="ip -color=auto"

# programs
alias npm="pnpm"
alias git="hub"
alias vim="nvim"
alias gpg="gpg2"

precmd() $funcstack[1]() echo
