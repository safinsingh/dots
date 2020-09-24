local awful = require("awful")
local gears = require("gears")

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.spiral.dwindle, awful.layout.suit.floating
    })
end)

client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 5) end
end)
