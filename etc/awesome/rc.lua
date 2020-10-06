pcall(require, "luarocks.loader")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")

require("vars")
require("startup")

require("keys")
require("notifs")

require("windows/rules")
require("windows/border")
require("windows/clients")

require("widgets/bar")
require("widgets/menu")
require("widgets/sidebar")
