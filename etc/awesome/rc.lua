-- .▄▄ · ▄▄▄▄▄▄▄▄ .▄▄▄ .▄▄▌  
-- ▐█ ▀. •██  ▀▄.▀·▀▄.▀·██•  
-- ▄▀▀▀█▄ ▐█.▪▐▀▀▪▄▐▀▀▪▄██▪  
-- ▐█▄▪▐█ ▐█▌·▐█▄▄▌▐█▄▄▌▐█▌▐▌
--  ▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀ .▀▀▀ 

-- Enable LuaRocks loader
pcall(require, "luarocks.loader")

-- Import critical modules
local naughty = require("naughty")
local beautiful = require("beautiful")
local gears = require("gears")
local awful = require("awful")
local ruled = require("ruled")

-- Import user-defined modules
local binds = require("binds")

-- ▌ ▐· ▄▄▄· ▄▄▄  .▄▄ · 
-- ▪█·█▌▐█ ▀█ ▀▄ █·▐█ ▀. 
-- ▐█▐█•▄█▀▀█ ▐▀▀▄ ▄▀▀▀█▄
--  ███ ▐█ ▪▐▌▐█•█▌▐█▄▪▐█
-- . ▀   ▀  ▀ .▀  ▀ ▀▀▀▀ 

-- Set Mod key (alt)
local modkey = "Mod1"

-- Essential program variables
local terminal = os.getenv("TERMINAL")
local editor = os.getenv("EDITOR")
local editor_cmd = terminal .. " -e " .. editor
local run_menu = "dmenu_run"
local scrot = "scr -S"

-- Theme settings
local theme = "steel"
local wall = "/home/etc/img/wp/tile.png"
local gaps = 30
local border = 10
local font = "Iosevka 14"

-- .▄▄ · ▄▄▄▄▄ ▄▄▄· ▄▄▄  ▄▄▄▄▄▄• ▄▌ ▄▄▄·
-- ▐█ ▀. •██  ▐█ ▀█ ▀▄ █·•██  █▪██▌▐█ ▄█
-- ▄▀▀▀█▄ ▐█.▪▄█▀▀█ ▐▀▀▄  ▐█.▪█▌▐█▌ ██▀·
-- ▐█▄▪▐█ ▐█▌·▐█ ▪▐▌▐█•█▌ ▐█▌·▐█▄█▌▐█▪·•
--  ▀▀▀▀  ▀▀▀  ▀  ▀ .▀  ▀ ▀▀▀  ▀▀▀ .▀   

-- Catch startup errors
naughty.connect_signal("request::display_error", 
	function(message, startup)
		naughty.notification {
			urgency = "critical",
			title = "An error occured" ..
				(startup and " during startup!" or "!"),
			message = message
		}
	end
)

-- Initialize theme
beautiful.init(
	os.getenv("XDG_CONFIG_HOME") .. 
	"awesome/themes/" .. 
	theme ..
	"/theme.lua"
)

-- Draw wallpaper
screen.connect_signal("request::wallpaper",
	function(s) 
		gears.wallpaper.tiled(wall, s) 
	end
)

-- Import custom widgets
local main_menu = require("widgets/menu")
local bar = require("widgets/bar")

-- Start compositor
awful.spawn(os.getenv("HOME") .. "/bin/phicom")

-- Set default layouts
tag.connect_signal("request::default_layouts", function()
	awful.layout.append_default_layouts({
		 awful.layout.suit.floating, awful.layout.suit.spiral.dwindle
	})
end)

-- Set basic window rules
ruled.client.connect_signal("request::rules", function()
	-- Enforce overflap and offscreen window spawning rules
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

	-- Force floating windows to have the floating property
	ruled.client.append_rule {
		 id = "floating",
		 rule_any = {instance = {}, class = {}, name = {}, role = {}},
		 properties = {floating = true}
	}

	-- Show titlebars on normal and dialog windows
	ruled.client.append_rule {
		 id = "titlebars",
		 rule_any = {type = {"normal", "dialog"}},
		 properties = {titlebars_enabled = true}
	}
end)


-- ▄▄▄▄· ▪   ▐ ▄ ·▄▄▄▄  .▄▄ · 
-- ▐█ ▀█▪██ •█▌▐███▪ ██ ▐█ ▀. 
-- ▐█▀▀█▄▐█·▐█▐▐▌▐█· ▐█▌▄▀▀▀█▄
-- ██▄▪▐█▐█▌██▐█▌██. ██ ▐█▄▪▐█
-- ·▀▀▀▀ ▀▀▀▀▀ █▪▀▀▀▀▀•  ▀▀▀▀ 

-- The keybinds are quite beefy, so they've
-- been abstracted to `keys.lua`

-- Set global binds
binds.set(modkey, terminal, run_menu, scrot, main_menu)

-- ▐ ▄       ▄▄▄▄▄▪  ·▄▄▄.▄▄ · 
-- •█▌▐█▪     •██  ██ ▐▄▄·▐█ ▀. 
-- ▐█▐▐▌ ▄█▀▄  ▐█.▪▐█·██▪ ▄▀▀▀█▄
-- ██▐█▌▐█▌.▐▌ ▐█▌·▐█▌██▌.▐█▄▪▐█
-- ▀▀ █▪ ▀█▄▀▪ ▀▀▀ ▀▀▀▀▀▀  ▀▀▀▀ 

-- Configure notification preferences
naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.margin = 10
naughty.config.defaults.position = "top_right"
naughty.config.spacing = 50
naughty.config.padding = 20

-- Display notifications when a connect signal
-- is recieved
naughty.connect_signal("request::display",
	function(n)
		naughty.layout.box { notification = n }
	end
)

-- ▄▄▌ ▐ ▄▌▪   ▐ ▄ ·▄▄▄▄        ▄▄▌ ▐ ▄▌.▄▄ · 
-- ██· █▌▐███ •█▌▐███▪ ██ ▪     ██· █▌▐█▐█ ▀. 
-- ██▪▐█▐▐▌▐█·▐█▐▐▌▐█· ▐█▌ ▄█▀▄ ██▪▐█▐▐▌▄▀▀▀█▄
-- ▐█▌██▐█▌▐█▌██▐█▌██. ██ ▐█▌.▐▌▐█▌██▐█▌▐█▄▪▐█
--  ▀▀▀▀ ▀▪▀▀▀▀▀ █▪▀▀▀▀▀•  ▀█▄▀▪ ▀▀▀▀ ▀▪ ▀▀▀▀ 

-- Draw titlebars
function draw_titlebars(c)
	-- Create initial titlebar 
	local tb = awful.titlebar(c, {
		size = border * 2, 
		position = "left",
		bg = beautiful.accent
	})
end

-- Draw titlebars when requested
client.connect_signal("request::titlebars", 
	function(c) 
		draw_titlebars(c)
	end
)

-- Focus newly spawned windows
client.connect_signal("spawn::completed", 
	function(c)
		c:activate {
			context = "mouse_enter", 
			raise = true
		}
	end
)

-- Activate and raise windowon hover
client.connect_signal("mouse::enter", 
	function(c)
		c:activate { 
			context = "mouse_enter", 
			raise = true
		}
	end
)

-- ▄▄▌ ▐ ▄▌▪  ·▄▄▄▄   ▄▄ • ▄▄▄ .▄▄▄▄▄.▄▄ · 
-- ██· █▌▐███ ██▪ ██ ▐█ ▀ ▪▀▄.▀·•██  ▐█ ▀. 
-- ██▪▐█▐▐▌▐█·▐█· ▐█▌▄█ ▀█▄▐▀▀▪▄ ▐█.▪▄▀▀▀█▄
-- ▐█▌██▐█▌▐█▌██. ██ ▐█▄▪▐█▐█▄▄▌ ▐█▌·▐█▄▪▐█
--  ▀▀▀▀ ▀▪▀▀▀▀▀▀▀▀• ·▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀▀ 

-- Draw bar on screen desktop decoration signal
screen.connect_signal("request::desktop_decoration", 
	function(s) 
		bar.draw_bar(s, gaps)
	end
)