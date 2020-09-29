local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.suit.spiral.dwindle)

    s.clock = wibox.widget.textclock("%H%M")

    s.taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.selected,
        layout = {spacing = gaps / 10, layout = wibox.layout.fixed.horizontal}
    }

    s.layout = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(-1) end),
            awful.button({}, 5, function() awful.layout.inc(1) end)
        }
    }

    s.bar = awful.wibar({
        position = "left",
        screen = s,
        width = gaps * 1.6,
        height = gaps * 10,
        shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, false, true,
                                               true, false, 6)
        end
    })

    s.bar:setup{
        {
            layout = wibox.layout.align.vertical,
            expand = "none",
            {layout = wibox.layout.fixed.vertical, s.taglist},
            {layout = wibox.layout.fixed.vertical, s.clock},
            {layout = wibox.layout.fixed.vertical, s.layout}
        },
        widget = wibox.container.margin,
        margins = gaps / 2
    }
end)
