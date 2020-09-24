local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local theme = dofile(themes_path .. "default/theme.lua")

theme.font = font

accents = {xrdb.color14, xrdb.color12, xrdb.color13}

-- GLOBAL COLORS
bg = xrdb.background
fg = xrdb.foreground
muted = xrdb.color8
accent = accents[math.random(#accents)]

theme.bg_normal = bg
theme.fg_normal = fg
theme.accent = accent

theme.bg_systray = bg

theme.fg_focus = bg
theme.fg_urgent = fg
theme.fg_minimize = bg

theme.bg_focus = accent

theme.useless_gap = dpi(gaps)
theme.border_width = dpi(border)

theme.border_color_normal = bg
theme.border_color_active = bg

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

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(25)
theme.menu_width = dpi(150)
theme.menu_border_width = dpi(7)

theme = theme_assets.recolor_layout(theme, theme.fg_normal)
theme.icon_theme = nil
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height,
                                               theme.bg_focus, theme.fg_focus)

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
