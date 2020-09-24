local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

awesome_menu = {
    {
        "hotkeys",
        function() hotkeys_popup.show_help(nil, awful.screen.focused()) end
    },
    {
        "edit config",
        editor_cmd .. os.getenv("HOME") .. "/.config/awesome/rc.lua"
    }, {"restart", awesome.restart}
}

main_menu = awful.menu({
    items = {
        {"awesome", awesome_menu, beautiful.awesome_icon}, {"term", terminal},
        {"browse", "brave"}
    }
})

launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = main_menu
})

menubar.utils.terminal = terminal
