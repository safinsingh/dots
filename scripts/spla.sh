#!/bin/bash

dir=~/.splash
[[ -d $dir ]] || mkdir $dir
c=1

while true; do
  wget -q -O $dir/$c.jpeg https://unsplash.it/3840/2160/?random
  feh --bg-fill $dir/$c.jpeg
  echo "Picture $c.jpeg has been downloaded!"
  c=$((c + 1))
done
