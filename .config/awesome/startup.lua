local naughty = require("naughty")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")

naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "Oops, an error happened" ..
            (startup and " during startup!" or "!"),
        message = message
    }
end)

screen.connect_signal("request::wallpaper",
                      function(s) gears.wallpaper.tiled(wall, s) end)

beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/" .. theme ..
                   "/theme.lua")

awful.spawn(os.getenv("HOME") .. "/.bin/phicom")
