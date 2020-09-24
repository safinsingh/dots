local awful = require("awful")
local wibox = require("wibox")

clock = wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1", "2", "3", "4", "5"}, s)

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
        height = gaps * 1.5
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

function remove_wibar(c)
    if c.fullscreen or c.maximized then
        s.mywibox.visible = false
    else
        s.mywibox.visible = true
    end
end

client.connect_signal("property::fullscreen", remove_wibar)
