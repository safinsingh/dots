-- .▄▄ · ▪  ·▄▄▄▄  ▄▄▄ .▄▄▄▄·  ▄▄▄· ▄▄▄  
-- ▐█ ▀. ██ ██▪ ██ ▀▄.▀·▐█ ▀█▪▐█ ▀█ ▀▄ █·
-- ▄▀▀▀█▄▐█·▐█· ▐█▌▐▀▀▪▄▐█▀▀█▄▄█▀▀█ ▐▀▀▄ 
-- ▐█▄▪▐█▐█▌██. ██ ▐█▄▄▌██▄▪▐█▐█ ▪▐▌▐█•█▌
--  ▀▀▀▀ ▀▀▀▀▀▀▀▀•  ▀▀▀ ·▀▀▀▀  ▀  ▀ .▀  ▀

-- NOTE: This is still VERY WIP! PLEASE
-- do not use this as an example for creating your
-- own widgets!

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local foreground = "#ff0000"

local clock = wibox.widget.textclock(
    "<span foreground='" .. beautiful.fg ..
    "'><b>%H<span foreground='" .. beautiful.fg ..
    "'>:</span>%M</b></span>"
)

local function intro(t)
    return wibox.widget {
        markup = '<span foreground="' .. beautiful.fg .. '"><i>' .. t ..
            '</i></span>',
        align = 'center',
        valign = 'center',
        widget = wibox.widget.textbox,
        font = "Rubik 20"
    }
end

local day = wibox.widget.textclock("<span foreground='" .. beautiful.accent ..
                                       "'><i>%A</i></span>")

clock.font = "Rubik Medium 80"
day.font = "Rubik Medium 40"

local function hwrap(w, --[[optional]] h)
    return {
        {
            nil,
            w,
            nil,
            layout = wibox.layout.align.horizontal,
            expand = "outside"
        },
        margins = h or 0,
        widget = wibox.container.margin
    }
end

local sidebar = awful.popup {
    widget = {
        {
            nil,
            {
                hwrap(clock),
                hwrap({
                    forced_width = 300,
                    forced_height = 20,
                    shape = function(cr, w, h)
                        gears.shape.rounded_rect(cr, w, h, 5)
                    end,
                    bg = beautiful.accent,
                    widget = wibox.container.background
                }),
                hwrap({
                    hwrap({
                        forced_height = 10,
                        widget = wibox.container.background
                    }),
                    hwrap(intro("p.s. it's")),
                    hwrap({
                        hwrap(day, 5),
                        hwrap(intro("and you need to")),
                        nil,
                        layout = wibox.layout.fixed.vertical
                    }),
                    layout = wibox.layout.fixed.vertical
                }),
                layout = wibox.layout.fixed.vertical
            },
            nil,
            forced_height = 1040,
            forced_width = 400,
            expand = "outside",
            layout = wibox.layout.align.vertical
        },
        margins = 10,
        widget = wibox.container.margin
    },
    bg = "#0f0f0f",
    placement = awful.placement.right,
    shape = function(cr, w, h)
        gears.shape.partially_rounded_rect(cr, w, h, true, false, false, true,
                                           20)
    end,
    visible = false,
    ontop = true
}

return sidebar