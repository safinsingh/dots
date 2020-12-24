#!/bin/bash

dir=/tmp/splash
if [[ -d $dir ]]; then
	rm -rf $dir
fi

mkdir $dir
c=1

while true; do
	wget -q -O $dir/$c.jpeg https://unsplash.it/3840/2160/?random
	feh --bg-fill $dir/$c.jpeg
	echo "Picture $c.jpeg has been downloaded!"
	c=$((c + 1))
done
