-- ▄▄▄▄· ▪   ▐ ▄ ·▄▄▄▄  .▄▄ · 
-- ▐█ ▀█▪██ •█▌▐███▪ ██ ▐█ ▀. 
-- ▐█▀▀█▄▐█·▐█▐▐▌▐█· ▐█▌▄▀▀▀█▄
-- ██▄▪▐█▐█▌██▐█▌██. ██ ▐█▄▪▐█
-- ·▀▀▀▀ ▀▀▀▀▀ █▪▀▀▀▀▀•  ▀▀▀▀ 

-- Import critical modules
local awful = require("awful")

-- Import custom widgets
-- local sidebar = require("widgets/sidebar")

-- Create return table
local binds = {}

binds.set = function (modkey, terminal, run_menu, scrot, main_menu)
    -- ▄ •▄ ▄▄▄ . ▄· ▄▌.▄▄ · 
    -- █▌▄▌▪▀▄.▀·▐█▪██▌▐█ ▀. 
    -- ▐▀▀▄·▐▀▀▪▄▐█▌▐█▪▄▀▀▀█▄
    -- ▐█.█▌▐█▄▄▌ ▐█▀·.▐█▄▪▐█
    -- ·▀  ▀ ▀▀▀   ▀ •  ▀▀▀▀ 

    -- Add default client keybinds
    client.connect_signal("request::default_keybindings", 
        function()
            awful.keyboard.append_client_keybindings({
                -- Move a focused client to a tag with Mod+Shift+tag
                awful.key {
                    modifiers = { modkey, "Shift"},
                    keygroup = "numrow",
                    group = "tag",
                    on_press = function(index)
                        if client.focus then
                            local tag = client.focus.screen.tags[index]
                            if tag then client.focus:move_to_tag(tag) end
                        end
                    end
                },

                -- Kill the focused window with Mod+q
                awful.key({ modkey }, "q", 
                    function(c) 
                        c:kill() 
                    end
                ),

                -- Toggle floating/dwindle layout
                awful.key({ modkey }, "f", awful.client.floating.toggle)
            })
        end
    )

    -- Append global keybinds
    awful.keyboard.append_global_keybindings({
        -- Restart awesome with Mod+Shift+r
        awful.key({ modkey, "Shift"}, "r", 
            awesome.restart
        ),

        -- Spawn terminal with Mod+Return
        awful.key({ modkey }, "Return", 
            function() awful.spawn(terminal) end
        ),

        -- Spawn Menu with Mod+d
        awful.key({ modkey }, "d", 
            function() awful.spawn(run_menu) end
        ),

        -- Take a screenshot with Prt Scrn
        awful.key({}, "Print", 
            function()
                awful.spawn.with_shell(scrot)
            end
        ),

        -- VOLUME --
        -- Raise volume with PulseAudio
        awful.key({}, "XF86AudioRaiseVolume", 
            function()
                awful.spawn("pactl set-sink-volume 0 +5%")
            end
        ),

        -- Lower volume with PulseAudio
        awful.key({}, "XF86AudioLowerVolume", 
            function()
                awful.spawn("pactl set-sink-volume 0 -5%")
            end
        ),

        -- Mute volume with PulseAudio
        awful.key({}, "XF86AudioMute", 
            function()
                awful.spawn("pactl set-sink-mute 0 toggle")
            end
        ),

        -- WINDOWS --
        -- Focus a selected tag with Mod+number
        awful.key {
            modifiers = { modkey },
            keygroup = "numrow",
            group = "tag",
            on_press = function(index)
                local screen = awful.screen.focused()
                local tag = screen.tags[index]
                if tag then tag:view_only() end
            end
        },
    })


    -- • ▌ ▄ ·.       ▄• ▄▌.▄▄ · ▄▄▄ .
    -- ·██ ▐███▪▪     █▪██▌▐█ ▀. ▀▄.▀·
    -- ▐█ ▌▐▌▐█· ▄█▀▄ █▌▐█▌▄▀▀▀█▄▐▀▀▪▄
    -- ██ ██▌▐█▌▐█▌.▐▌▐█▄█▌▐█▄▪▐█▐█▄▄▌
    -- ▀▀  █▪▀▀▀ ▀█▄▀▪ ▀▀▀  ▀▀▀▀  ▀▀▀ 

    -- Append client-specific mouse keybinds
    client.connect_signal("request::default_mousebindings", 
        function()
            awful.mouse.append_client_mousebindings({
                -- Register a right click as a mouse click
                awful.button({}, 1,
                    function(c)
                        c:activate {
                            context = "mouse_click"
                        }
                    end
                ),

                -- Drag windows around by holding Mod
                awful.button({ modkey }, 1, 
                    function(c)
                        c:activate { 
                            context = "mouse_click", 
                            action = "mouse_move"
                        }
                    end
                ),

                -- Register a Mod+right click on a client as a resize
                awful.button({ modkey }, 3, 
                    function(c)
                        c:activate{context = "mouse_click", action = "mouse_resize"}
                    end
                )
            })
        end
    )

    -- Append global mouse keybinds
    awful.mouse.append_global_mousebindings({
        -- Toggle the visibility of the sidebar
        awful.button({}, 2, function()
            if sidebar.visible == true then
                sidebar.visible = false
            else
                sidebar.visible = true
            end
        end),
        
        -- Register a right click on the desktop as a main menu toggle
        awful.button({}, 3, 
            function() main_menu:toggle() end
        ),
    })
end

return binds