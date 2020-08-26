-- awesome_mode: api-level=4:screen=on
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local xrdb = beautiful.xresources.get_current_theme()
require("awful.hotkeys_popup.keys")
require("awful.autofocus")

x = {
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0 = xrdb.color0,
    color1 = xrdb.color1,
    color2 = xrdb.color2,
    color3 = xrdb.color3,
    color4 = xrdb.color4,
    color5 = xrdb.color5,
    color6 = xrdb.color6,
    color7 = xrdb.color7,
    color8 = xrdb.color8,
    color9 = xrdb.color9,
    color10 = xrdb.color10,
    color11 = xrdb.color11,
    color12 = xrdb.color12,
    color13 = xrdb.color13,
    color14 = xrdb.color14,
    color15 = xrdb.color15
}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "Oops, an error happened" ..
            (startup and " during startup!" or "!"),
        message = message
    }
end)
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = "vim"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
    {
        "hotkeys",
        function() hotkeys_popup.show_help(nil, awful.screen.focused()) end
    }, {"manual", terminal .. " -e man awesome"},
    {"edit config", editor_cmd .. " " .. awesome.conffile},
    {"restart", awesome.restart}, {"quit", function() awesome.quit() end}
}

mymainmenu = awful.menu({
    items = {
        {"awesome", myawesomemenu, beautiful.awesome_icon},
        {"open terminal", terminal}
    }
})

mylauncher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Tag
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.floating, awful.layout.suit.tile,
        awful.layout.suit.tile.left, awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top, awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal, awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle, awful.layout.suit.max,
        awful.layout.suit.max.fullscreen, awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw
    })
end)
-- }}}

-- {{{ Wibar

screen.connect_signal("request::wallpaper", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then wallpaper = wallpaper(s) end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s,
              awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({}, 1, function(t) t:view_only() end),
            awful.button({modkey}, 1, function(t)
                if client.focus then client.focus:move_to_tag(t) end
            end), awful.button({}, 3, awful.tag.viewtoggle),
            awful.button({modkey}, 3, function(t)
                if client.focus then client.focus:toggle_tag(t) end
            end),
            awful.button({}, 4, function(t)
                awful.tag.viewprev(t.screen)
            end),
            awful.button({}, 5, function(t)
                awful.tag.viewnext(t.screen)
            end)
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "bottom",
        screen = s,
        height = 35,
        bg = "#00000000",
        fg = x.color6
    })

    -- Add widgets to the wibox
    s.mywibox.widget = {
        {layout = wibox.layout.fixed.horizontal},
        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox
        },
        {layout = wibox.layout.fixed.horizontal},
        layout = wibox.layout.align.horizontal,
    }
end)
-- }}}

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({}, 3, function() mymainmenu:toggle() end),
    awful.button({}, 4, awful.tag.viewprev),
    awful.button({}, 5, awful.tag.viewnext)
})
-- }}}

-- {{{ Key bindings

-- General Awesome keys
awful.keyboard.append_global_keybindings(
    {
        awful.key({modkey}, "s", hotkeys_popup.show_help,
                  {description = "show help", group = "awesome"}),
        awful.key({modkey}, "w", function() mymainmenu:show() end,
                  {description = "show main menu", group = "awesome"}),
        awful.key({modkey, "Control"}, "r", awesome.restart,
                  {description = "reload awesome", group = "awesome"}),
        awful.key({modkey, "Shift"}, "q", awesome.quit,
                  {description = "quit awesome", group = "awesome"}),
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end,
                  {description = "open a terminal", group = "launcher"}),
        awful.key({modkey}, "d",
                  function() awful.screen.focused().mypromptbox:run() end,
                  {description = "run prompt", group = "launcher"}),
        awful.key({modkey}, "p", function() menubar.show() end,
                  {description = "show the menubar", group = "launcher"})
    })

-- Tags related keybindings
awful.keyboard.append_global_keybindings(
    {
        awful.key({modkey}, "Left", awful.tag.viewprev,
                  {description = "view previous", group = "tag"}),
        awful.key({modkey}, "Right", awful.tag.viewnext,
                  {description = "view next", group = "tag"}),
        awful.key({modkey}, "Escape", awful.tag.history.restore,
                  {description = "go back", group = "tag"})
    })

-- Focus related keybindings
awful.keyboard.append_global_keybindings(
    {
        awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end,
                  {description = "focus next by index", group = "client"}),
        awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end,
                  {description = "focus previous by index", group = "client"}),
        awful.key({modkey}, "Tab", function()
            awful.client.focus.history.previous()
            if client.focus then client.focus:raise() end
        end, {description = "go back", group = "client"}),
        awful.key({modkey, "Control"}, "j",
                  function() awful.screen.focus_relative(1) end,
                  {description = "focus the next screen", group = "screen"}),
        awful.key({modkey, "Control"}, "k",
                  function() awful.screen.focus_relative(-1) end,
                  {description = "focus the previous screen", group = "screen"}),
        awful.key({modkey, "Control"}, "n", function()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:activate{raise = true, context = "key.unminimize"}
            end
        end, {description = "restore minimized", group = "client"})
    })

-- Layout related keybindings
awful.keyboard.append_global_keybindings(
    {
        awful.key({modkey, "Shift"}, "j",
                  function() awful.client.swap.byidx(1) end, {
            description = "swap with next client by index",
            group = "client"
        }),
        awful.key({modkey, "Shift"}, "k",
                  function() awful.client.swap.byidx(-1) end, {
            description = "swap with previous client by index",
            group = "client"
        }), awful.key({modkey}, "u", awful.client.urgent.jumpto,
                      {description = "jump to urgent client", group = "client"}),
        awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end, {
            description = "increase master width factor",
            group = "layout"
        }), awful.key({modkey}, "h", function()
            awful.tag.incmwfact(-0.05)
        end, {description = "decrease master width factor", group = "layout"}),
        awful.key({modkey, "Shift"}, "h",
                  function() awful.tag.incnmaster(1, nil, true) end, {
            description = "increase the number of master clients",
            group = "layout"
        }), awful.key({modkey, "Shift"}, "l",
                      function() awful.tag.incnmaster(-1, nil, true) end, {
            description = "decrease the number of master clients",
            group = "layout"
        }), awful.key({modkey, "Control"}, "h",
                      function() awful.tag.incncol(1, nil, true) end, {
            description = "increase the number of columns",
            group = "layout"
        }), awful.key({modkey, "Control"}, "l",
                      function() awful.tag.incncol(-1, nil, true) end, {
            description = "decrease the number of columns",
            group = "layout"
        }), awful.key({modkey}, "space", function() awful.layout.inc(1) end,
                      {description = "select next", group = "layout"}),
        awful.key({modkey, "Shift"}, "space",
                  function() awful.layout.inc(-1) end,
                  {description = "select previous", group = "layout"})
    })

awful.keyboard.append_global_keybindings(
    {
        awful.key {
            modifiers = {modkey},
            keygroup = "numrow",
            description = "only view tag",
            group = "tag",
            on_press = function(index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then tag:view_only() end
            end
        }, awful.key {
            modifiers = {modkey, "Control"},
            keygroup = "numrow",
            description = "toggle tag",
            group = "tag",
            on_press = function(index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then awful.tag.viewtoggle(tag) end
            end
        }, awful.key {
            modifiers = {modkey, "Shift"},
            keygroup = "numrow",
            description = "move focused client to tag",
            group = "tag",
            on_press = function(index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then client.focus:move_to_tag(tag) end
                end
            end
        }, awful.key {
            modifiers = {modkey, "Control", "Shift"},
            keygroup = "numrow",
            description = "toggle focused client on tag",
            group = "tag",
            on_press = function(index)
                if client.focus then
                    local tag = client.focus.screen.tags[index]
                    if tag then client.focus:toggle_tag(tag) end
                end
            end
        }, awful.key {
            modifiers = {modkey},
            keygroup = "numpad",
            description = "select layout directly",
            group = "layout",
            on_press = function(index)
                local t = awful.screen.focused().selected_tag
                if t then t.layout = t.layouts[index] or t.layout end
            end
        }
    })

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings(
        {
            awful.button({}, 1,
                         function(c)
                c:activate{context = "mouse_click"}
            end), awful.button({modkey}, 1, function(c)
                c:activate{context = "mouse_click", action = "mouse_move"}
            end), awful.button({modkey}, 3, function(c)
                c:activate{context = "mouse_click", action = "mouse_resize"}
            end)
        })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings(
        {
            awful.key({modkey}, "f", function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end, {description = "toggle fullscreen", group = "client"}),
            awful.key({modkey, "Shift"}, "c", function(c) c:kill() end,
                      {description = "close", group = "client"}),
            awful.key({modkey, "Control"}, "space",
                      awful.client.floating.toggle,
                      {description = "toggle floating", group = "client"}),
            awful.key({modkey, "Control"}, "Return",
                      function(c) c:swap(awful.client.getmaster()) end,
                      {description = "move to master", group = "client"}),
            awful.key({modkey}, "o", function(c) c:move_to_screen() end,
                      {description = "move to screen", group = "client"}),
            awful.key({modkey}, "t", function(c)
                c.ontop = not c.ontop
            end, {description = "toggle keep on top", group = "client"}),
            awful.key({modkey}, "n", function(c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end, {description = "minimize", group = "client"}),
            awful.key({modkey}, "m", function(c)
                c.maximized = not c.maximized
                c:raise()
            end, {description = "(un)maximize", group = "client"}),
            awful.key({modkey, "Control"}, "m", function(c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end, {description = "(un)maximize vertically", group = "client"}),
            awful.key({modkey, "Shift"}, "m", function(c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end, {description = "(un)maximize horizontally", group = "client"})
        })
end)

-- }}}

-- {{{ Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id = "global",
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap +
                awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = {"copyq", "pinentry"},
            class = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester" -- xev.
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "ConfigManager", -- Thunderbird's about:config.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {floating = true}
    }

    -- Add titlebars to normal clients and dialogs
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = {type = {"normal", "dialog"}},
        properties = {titlebars_enabled = true}
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

-- }}}

-- {{{ Titlebars
-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = {
        awful.button({}, 1, function()
            c:activate{context = "titlebar", action = "mouse_move"}
        end), awful.button({}, 3, function()
            c:activate{context = "titlebar", action = "mouse_resize"}
        end)
    }

    awful.titlebar(c).widget = {
        {buttons = buttons, layout = wibox.layout.fixed.horizontal},
        {buttons = buttons, layout = wibox.layout.flex.horizontal},
        {
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        widget = wibox.container.margin,
        layout = wibox.layout.align.horizontal
    }
end)

-- {{{ Notifications

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = {},
        properties = {screen = awful.screen.preferred, implicit_timeout = 5}
    }
end)

naughty.connect_signal("request::display",
                       function(n) naughty.layout.box {notification = n} end)

-- }}}

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate{context = "mouse_enter", raise = false}
end)

-- Autostart applications
awful.spawn.with_shell(
    "feh --bg-fill /home/safin/dots/.config/images/awesome.jpg")

-- Garbage collection
-- Enable for lower memory consumption
-- ===================================================================

-- collectgarbage("setpause", 160)
-- collectgarbage("setstepmul", 400)

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

client.connect_signal("manage", function(c)
    c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
end)

beautiful.init("/home/safin/dots/.config/awesome/themes/rainfall/theme.lua")
