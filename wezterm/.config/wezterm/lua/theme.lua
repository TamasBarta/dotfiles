local wezterm = require("wezterm")

local isDark = wezterm.gui.get_appearance():find("Dark")

local M = {}

M.apply_to_config = function(config)
	local catppuccin = wezterm.plugin.require("https://github.com/catppuccin/wezterm")
	if isDark then
		catppuccin.apply_to_config(config, { variant = "mocha" })
		config.window_background_opacity = 0.9
	else
		catppuccin.apply_to_config(config, { variant = "latte" })
		config.window_background_opacity = 0.6
	end
end

return M
