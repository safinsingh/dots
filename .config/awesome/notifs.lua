local ruled = require("ruled")
local naughty = require("naughty")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local dpi = beautiful.xresources.apply_dpi

naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.margin = dpi(10)
naughty.config.defaults.position = "top_right"
naughty.config.spacing = dpi(50)
naughty.config.padding = dpi(20)

naughty.connect_signal("request::display",
                       function(n) naughty.layout.box {notification = n} end)
