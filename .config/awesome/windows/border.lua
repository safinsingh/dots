local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

client.connect_signal("request::titlebars", function(c)
    local buttons = {
        awful.button({}, 1, function()
            c:activate{context = "titlebar", action = "mouse_move"}
        end), awful.button({}, 3, function()
            c:activate{context = "titlebar", action = "mouse_resize"}
        end)
    }

    local top_tb = awful.titlebar(c, {
        size = border / 2,
        bg_normal = "#363636",
        bg_focus = "#050505"
    })

    top_tb:setup{
        nil,
        {
            shape = function(cr, width, height)
                gears.shape.partially_rounded_rect(cr, width, height, true,
                                                   true, false, false,
                                                   border / 2)
            end,
            bg = "#8c89a3",
            widget = wibox.container.background
        },
        nil,
        layout = wibox.layout.align.horizontal
    }

    local bottom_tb = awful.titlebar(c, {
        size = border / 2,
        bg_normal = "#363636",
        bg_focus = "#050505",
        position = "bottom"
    })

    bottom_tb:setup{
        nil,
        {
            shape = function(cr, width, height)
                gears.shape.partially_rounded_rect(cr, width, height, false,
                                                   false, true, true, border / 2)
            end,
            bg = "#8c89a3",
            widget = wibox.container.background
        },
        nil,
        layout = wibox.layout.align.horizontal
    }

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = "#363636",
        bg_focus = theme.accent,
        position = "right"
    })

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = "#363636",
        bg_focus = theme.accent,
        position = "left"
    })
end)

client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = true}
end)
