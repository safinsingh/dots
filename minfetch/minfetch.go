package main

import (
	"github.com/gookit/color"
)

type info struct {
	key   string
	val   string
	color string
}

func (i info) Fetch() {
	l := color.Black
	b := color.New(color.FgWhite, color.OpBold)

	hex := color.HEX(i.color)
	hex.Print(i.key)
	l.Print(" | ")
	b.Println(i.val)
}

func main() {
	fetch := []info{
		{
			key:   "os",
			val:   "mj",
			color: "#E95378",
		},
		{
			key:   "kr",
			val:   "lx",
			color: "#FC78A8",
		},
		{
			key:   "sh",
			val:   "zh",
			color: "#DEA584",
		},
		{
			key:   "wm",
			val:   "i3",
			color: "#69F595",
		},
		{
			key:   "cu",
			val:   "i7",
			color: "#3EE2F0",
		},
		{
			key:   "mm",
			val:   "16",
			color: "#CF74FF",
		},
	}

	for _, info := range fetch {
		info.Fetch()
	}
}
