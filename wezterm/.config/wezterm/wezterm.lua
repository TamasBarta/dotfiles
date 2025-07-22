local wezterm = require("wezterm")

local config = wezterm.config_builder()

local isLinux = wezterm.target_triple:find("linux")
local os = require("os")
local isGnome = (os.getenv("XDG_CURRENT_DESKTOP") or ""):find("gnome") or false

config.font = wezterm.font_with_fallback({ "JetbrainsMono NF", "JetbrainsMono Nerd Font" })
config.font_size = isLinux and 11.5 or 14
config.command_palette_font_size = isLinux and 11.5 or 17
config.line_height = 1.15
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
if isLinux then
	if isGnome then
		config.window_background_opacity = 1
		config.integrated_title_button_style = "Gnome"
		config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	else
		-- config.window_decorations = "RESIZE"
	end
else
	config.macos_window_background_blur = 90
	config.integrated_title_button_style = "MacOsNative"
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.window_decorations = "RESIZE"
end
config.hyperlink_rules = {}
config.term = "wezterm"
config.max_fps = 160

require("lua.theme").apply_to_config(config)
-- require("lua.tabline").apply_to_config(config)
config.keys = require("lua.keymaps")
require("lua.smart-splits").apply_to_config(config)

return config
