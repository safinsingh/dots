local awful = require("awful")
local gears = require("gears")

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating, awful.layout.suit.spiral.dwindle
    })
end)

client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, border / 2)
    end
end)

client.connect_signal("spawn::completed", function(c)
    c:activate{context = "mouse_enter", raise = true}
end)

client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = true}
end)
