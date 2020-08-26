local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local themes_path = "/home/safin/dots/.config/awesome/themes/"

local theme = {}

theme.font = "Rubik 15"

theme.bg_dark = x.background
theme.bg_normal = x.background
theme.bg_focus = x.background
theme.bg_urgent = x.color6
theme.bg_minimize = x.background
theme.bg_systray = x.background

theme.fg_normal = x.foreground
theme.fg_focus = x.color6
theme.fg_urgent = x.color6
theme.fg_minimize = x.foreground

theme.useless_gap = dpi(20)
theme.border_width = dpi(1)
theme.border_color_normal = x.background
theme.border_color_active = "#1f272e"
theme.border_color_marked = x.background

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

theme.taglist_bg_focus = "transparent"
theme.taglist_fg_occupied = "#ffffff44"
theme.taglist_fg_urgent   = "#ffffff44"
theme.taglist_fg_empty    = "#ffffff44"
theme.taglist_font = "JetBrainsMono Nerd Font 15"

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(0)
theme.menu_width = dpi(100)

theme.titlebar_close_button_normal = themes_path .. "rainfall/icons/close.png"
theme.titlebar_close_button_focus = themes_path .. "rainfall/icons/close.png"

theme.titlebar_minimize_button_normal = themes_path .. "rainfall/icons/min.png"
theme.titlebar_minimize_button_focus = themes_path .. "rainfall/icons/min.png"

theme.titlebar_maximized_button_normal_inactive =
    themes_path .. "rainfall/icons/max.png"
theme.titlebar_maximized_button_focus_inactive =
    themes_path .. "rainfall/icons/max.png"
theme.titlebar_maximized_button_normal_active =
    themes_path .. "rainfall/icons/max.png"
theme.titlebar_maximized_button_focus_active =
    themes_path .. "rainfall/icons/max.png"

theme.wallpaper = themes_path .. "default/background.png"

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule = {urgency = 'critical'},
        properties = {bg = '#ff0000', fg = '#ffffff'}
    }
end)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
