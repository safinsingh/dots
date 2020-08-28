package main

import (
	"fmt"

	"github.com/gookit/color"
)

type info struct {
	key string
	val string
}

func (i info) Fetch() {
	b := color.New(color.FgWhite, color.OpBold)
	f := color.New(color.FgRed)

	f.Print("    " + i.key + "  ")
	b.Println(i.val)
}

func main() {
	fetch := []info{
		{
			key: "os",
			val: "mj",
		},
		{
			key: "wm",
			val: "i3",
		},
		{
			key: "up",
			val: "zh",
		},
	}

	fmt.Println()
	for _, info := range fetch {
		info.Fetch()
	}
	fmt.Println()
}
