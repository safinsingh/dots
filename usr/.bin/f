#!/bin/bash

w="$(tput setaf 6)"
c="$w$(tput bold)"
r="$(tput sgr0)$(tput setaf 7)"

wm=$(wmctrl -m 2>/dev/null |
   grep "Name" |
   cut -d " " -f2)

[[ -z $wm ]] && wm="bspwm"

os=$(
   . /etc/os-release
   echo "$ID"
)
pk=$(pacman -Qq | wc -l)

echo "${w}  卑${r}    os ${c}::${r} $os
${w} 卑卑${r}   wm ${c}::${r} $wm
${w}卑卑卑${r}  pk ${c}::${r} $pk
"
