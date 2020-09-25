local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
theme = dofile(themes_path .. "default/theme.lua")

theme.font = "Iosevka 14"

theme.bg = xrdb.background
theme.fg = xrdb.foreground
theme.accent = xrdb.color12
theme.muted = xrdb.color8

theme.bg_normal = bg
theme.fg_normal = fg

theme.bg_systray = bg

theme.fg_focus = bg
theme.fg_urgent = fg
theme.fg_minimize = bg

theme.bg_focus = accent

theme.useless_gap = dpi(30)
theme.border_width = dpi(8)

theme.border_color_normal = bg
theme.border_color_active = bg

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
-- theme.taglist_bg_focus = "#ff0000"

theme.taglist_bg_focus = bg
theme.taglist_fg_empty = muted
theme.taglist_fg_occupied = muted
theme.taglist_fg_focus = fg

theme.tooltip_fg_color = fg
theme.tooltip_bg_color = bg

theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil
theme.taglist_squares_sel_empty = nil
theme.taglist_squares_unsel_empty = nil
theme.taglist_squares_resize = nil

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)
theme.menu_border_width = dpi(7)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
-- theme.bg_widget = "#cc0000"

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)
theme.icon_theme = nil
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height,
                                               theme.bg_focus, theme.fg_focus)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
