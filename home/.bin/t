#!/bin/sh

bat="$(cat /sys/class/power_supply/BAT0/capacity)"

date +'%a, %0e | %I:%M %p' | tr -d '\n'
printf " |  $bat%%"
