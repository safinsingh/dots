local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

function draw_borders(c, active)
    local color = theme.accent

    local left_tb = awful.titlebar(c, {size = border * 2, position = "left"})
    left_tb:setup{
        nil,
        {
            shape = function(cr, width, height)
                gears.shape.partially_rounded_rect(cr, width, height, true,
                                                   false, false, true, 2)
            end,
            widget = wibox.container.background,
            bg = color
        },
        nil,
        layout = wibox.layout.align.horizontal
    }
end

client.connect_signal("request::titlebars",
                      function(c) draw_borders(c, true) end)
