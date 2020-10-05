local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local gears = require("gears")
local themes_path = gfs.get_themes_dir()

theme = dofile(themes_path .. "default/theme.lua")

theme.font = font

theme.bg = "#0F1010"
theme.fg = xrdb.foreground
theme.accent = xrdb.color0
theme.muted = xrdb.color8

theme.bg_normal = theme.bg
theme.fg_normal = theme.fg

theme.bg_systray = theme.bg

theme.fg_focus = theme.bg
theme.fg_urgent = theme.fg
theme.fg_minimize = theme.bg

theme.bg_focus = theme.accent

theme.useless_gap = dpi(30)
theme.border_width = dpi(0)

theme.border_color_normal = theme.bg
theme.border_color_active = theme.bg

theme.taglist_bg_focus = theme.bg
theme.taglist_fg_empty = theme.muted
theme.taglist_fg_occupied = theme.muted
theme.taglist_fg_focus = theme.fg

theme.tooltip_fg_color = theme.fg
theme.tooltip_bg_color = theme.bg

theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil
theme.taglist_squares_sel_empty = nil
theme.taglist_squares_unsel_empty = nil
theme.taglist_squares_resize = nil

theme.notification_fg = theme.fg
theme.notification_bg = theme.bg
theme.notification_border_width = 4
theme.notification_border_color = theme.accent
theme.notification_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
end
theme.notification_font = "Iosevka Heavy 14"
theme.notification_width = dpi(300)
theme.notification_height = dpi(100)

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)
theme.menu_border_width = dpi(border)
theme.menu_bg_focus = theme.accent

theme = theme_assets.recolor_layout(theme, theme.fg_normal)
theme.icon_theme = nil
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height,
                                               theme.bg_focus, theme.fg_focus)

return theme
