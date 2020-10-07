-- .▄▄ · ▄▄▄▄▄▄▄▄ .▄▄▄ .▄▄▌  
-- ▐█ ▀. •██  ▀▄.▀·▀▄.▀·██•  
-- ▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐▀▀▪▄██▪  
-- ▐█▄▪▐█ ▐█▌·▐█▄▄▌▐█▄▄▌▐█▌▐▌
--  ▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀ .▀▀▀ 

-- Import critical modules
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local gears = require("gears")

local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local themes_path = gears.filesystem.get_themes_dir()

-- Theme settings
local border = 10
local font = "Iosevka 14"

-- Initialize theme with template
local theme = dofile(themes_path .. "default/theme.lua")

-- Set theme font
theme.font = "Iosevka 14"

-- Set global colors
theme.bg = xrdb.background
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

-- Set window decoration properties
theme.useless_gap = 30
theme.border_width = 0

theme.border_color_normal = theme.bg
theme.border_color_active = theme.bg

-- Set taglist (in wibar) colors & geometry
theme.taglist_bg_focus = theme.bg
theme.taglist_fg_empty = theme.muted
theme.taglist_fg_occupied = theme.muted
theme.taglist_fg_focus = theme.fg
theme.taglist_squares_sel = nil
theme.taglist_squares_unsel = nil
theme.taglist_squares_sel_empty = nil
theme.taglist_squares_unsel_empty = nil
theme.taglist_squares_resize = nil

-- Set tooltop colorscheme
theme.tooltip_fg_color = theme.fg
theme.tooltip_bg_color = theme.bg

-- Set notification colors & geometry
theme.notification_fg = theme.fg
theme.notification_bg = theme.bg
theme.notification_border_width = 4
theme.notification_border_color = theme.accent
theme.notification_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 4)
end
theme.notification_font = "Iosevka Heavy 14"
theme.notification_width = 300
theme.notification_height = 100

-- Set submenu colors and geometry
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = 25
theme.menu_width = 150
theme.menu_border_width = border
theme.menu_bg_focus = theme.accent
theme.menu_fg_focus = theme.fg

-- Recolor assets with theme colors
theme = theme_assets.recolor_layout(theme, theme.fg_normal)
theme.icon_theme = nil
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height,
    theme.bg_focus,
    theme.fg_focus
)

return theme