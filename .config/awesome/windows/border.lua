local awful = require("awful")

client.connect_signal("request::titlebars", function(c)
    local buttons = {
        awful.button({}, 1, function()
            c:activate{context = "titlebar", action = "mouse_move"}
        end), awful.button({}, 3, function()
            c:activate{context = "titlebar", action = "mouse_resize"}
        end)
    }

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = theme.muted,
        bg_focus = theme.accent
    })

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = theme.muted,
        bg_focus = theme.accent,
        position = "bottom"
    })

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = theme.muted,
        bg_focus = theme.accent,
        position = "right"
    })

    awful.titlebar(c, {
        size = border / 2,
        bg_normal = theme.muted,
        bg_focus = theme.accent,
        position = "left"
    })
end)

client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = true}
end)
