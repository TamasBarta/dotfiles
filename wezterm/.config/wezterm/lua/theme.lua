local wezterm = require("wezterm")

local isDark = wezterm.gui.get_appearance():find("Dark")

local M = {}

M.apply_to_config = function(config)
	local catppuccin = wezterm.plugin.require("https://github.com/catppuccin/wezterm")
	if isDark then
		catppuccin.apply_to_config(config, { flavor = "mocha" })
		config.window_background_opacity = 0.9
	else
		catppuccin.apply_to_config(config, { flavor = "latte" })
		config.window_background_opacity = 0.85
	end
	config.window_background_opacity = 1
end

return M
