#!/bin/sh

[ -d ".git" ] || {
	echo "not a git repository!"
	exit 1
}

[ -z "$1" ] && {
	printf "[COMMIT MESSAGE]: "
	read -r cmt
} || cmt="${1:-"n/a"}"

cat <<EOF
Can be:
 - (b) build:		affects build system
 - (c) ci:			continuous integration
 - (d) docs: 		documentation
 - (f) feat: 		new feature
 - (u) fix: 		bugfix
 - (p) perf: 		improves performance
 - (r) refactor: 	organization
 - (s) style: 		formatting
 - (t) test: 		testing
EOF

printf "[COMMIT TYPE]: "
read -r ct

case $ct in
"b")
	msg="build: $cmt"
	;;
"c")
	msg="ci: $cmt"
	;;
"d")
	msg="docs: $cmt"
	;;
"f")
	msg="feat: $cmt"
	;;
"u")
	msg="fix: $cmt"
	;;
"p")
	msg="perf: $cmt"
	;;
"r")
	msg="refactor: $cmt"
	;;
"s")
	msg="style: $cmt"
	;;
"t")
	msg="test: $cmt"
	;;
esac

[ -z "$ct" ] || {
	git add .
	git commit -m "$msg"
	git push origin master
}
