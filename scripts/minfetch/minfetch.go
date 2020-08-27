package main

import (
	"github.com/gookit/color"
)

type info struct {
	key   string
	val   string
	color color.Color
}

func (i info) Fetch() {
	l := color.HEX("928374")
	b := color.New(color.FgWhite, color.OpBold)
	f := color.New(i.color)

	f.Print(i.key)
	l.Print(" | ")
	b.Println(i.val)
}

func main() {
	fetch := []info{
		{
			key:   "os",
			val:   "mj",
			color: color.FgRed,
		},
		{
			key:   "kr",
			val:   "lx",
			color: color.FgYellow,
		},
		{
			key:   "sh",
			val:   "zh",
			color: color.FgGreen,
		},
		{
			key:   "wm",
			val:   "i3",
			color: color.FgCyan,
		},
		{
			key:   "cu",
			val:   "i7",
			color: color.FgBlue,
		},
		{
			key:   "mm",
			val:   "16",
			color: color.FgMagenta,
		},
	}

	for _, info := range fetch {
		info.Fetch()
	}
}
