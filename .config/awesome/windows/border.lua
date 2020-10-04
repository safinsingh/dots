local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local function gradient(w, h)
    return {
        type = 'linear',
        from = {0, 0},
        to = {w, h},
        stops = {{0, "#91ed86"}, {0.45, "#86edd5"}, {1, "#86b9ed"}}
    }
end

function draw_borders(c)
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
            bg = theme.accent -- gradient(border * 2, c.height)
        },
        nil,
        layout = wibox.layout.align.horizontal
    }
end

client.connect_signal("request::titlebars", function(c) draw_borders(c) end)
