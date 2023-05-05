local wezterm = require("wezterm")

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") or string.find(wezterm.target_triple, "linux") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

return {
	term = "wezterm",
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	font = wezterm.font("JetbrainsMono Nerd Font"),
	-- font = wezterm.font("Iosevka Nerd Font"),
	-- font = wezterm.font("VictorMono Nerd Font"),
	font_size = string.find(wezterm.target_triple, "linux") and 11.5 or 15,
	line_height = 1.1,
	front_end = "WebGpu",
	window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0.0cell",
		bottom = "0.0cell",
	},
	enable_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	window_decorations = "RESIZE",
	window_frame = {
		-- The font used in the tab bar.
		-- Roboto Bold is the default; this font is bundled
		-- with wezterm.
		-- Whatever font is selected here, it will have the
		-- main font setting appended to it to pick up any
		-- fallback fonts you may have used there.
		font = wezterm.font({ family = "Roboto", weight = "Bold" }),
		-- The size of the font in the tab bar.
		-- Default to 10. on Windows but 12.0 on other systems
		font_size = 13.0,
		-- The overall background color of the tab bar when
		-- the window is focused
		active_titlebar_bg = "#333333",
		-- The overall background color of the tab bar when
		-- the window is not focused
		inactive_titlebar_bg = "#333333",
	},
	colors = {
		tab_bar = {
			-- The color of the inactive tab bar edge/divider
			inactive_tab_edge = "#575757",
		},
	},
	keys = {
		{
			key = "Enter",
			mods = "ALT",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
}
