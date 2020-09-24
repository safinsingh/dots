local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

clock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1", "2", "3", "4", "5"}, s, awful.layout.suit.spiral.dwindle)

    s.taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.selected,
        layout = {spacing = gaps / 10, layout = wibox.layout.fixed.horizontal}
    }

    s.mylayoutbox = awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({}, 1, function() awful.layout.inc(1) end),
            awful.button({}, 3, function() awful.layout.inc(-1) end),
            awful.button({}, 4, function() awful.layout.inc(-1) end),
            awful.button({}, 5, function() awful.layout.inc(1) end)
        }
    }

    s.bar = awful.wibar({
        position = "bottom",
        screen = s,
        width = gaps * 10,
        height = gaps * 1.5,
        shape = function(cr, width, height)
            gears.shape.partially_rounded_rect(cr, width, height, true, true,
                                               false, false, 6)
        end
    })

    s.bar:setup{
        {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            {layout = wibox.layout.fixed.horizontal, s.taglist},
            {layout = wibox.layout.fixed.horizontal, clock},
            {layout = wibox.layout.fixed.horizontal, s.mylayoutbox}
        },
        widget = wibox.container.margin,
        margins = gaps / 2
    }
end)
