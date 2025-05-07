local wezterm = require("wezterm")

return {
	{ key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "p", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{
		key = "p",
		mods = "SUPER|ALT",
		action = wezterm.action.QuickSelectArgs({
			label = "copy",
		}),
	},
	{ key = "p", mods = "SUPER", action = wezterm.action.ActivateCommandPalette },
	{
		key = "p",
		mods = "SUPER|SHIFT",
		action = wezterm.action.QuickSelectArgs({
			label = "open",
			action = wezterm.action_callback(function(window, pane)
				local url = window:get_selection_text_for_pane(pane)
				wezterm.log_info("opening: " .. url)
				wezterm.open_with(url)
			end),
		}),
	},
	{ key = "PageUp", mods = "SHIFT", action = wezterm.action.ScrollByPage(-0.5) },
	{ key = "PageDown", mods = "SHIFT", action = wezterm.action.ScrollByPage(0.5) },
	{
		key = "e",
		mods = "SUPER",
		action = wezterm.action({ EmitEvent = require("lua.vim-scrollback").setup() }),
	},
	{ key = "h", mods = "SUPER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "l", mods = "SUPER", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "z", mods = "SUPER", action = wezterm.action.TogglePaneZoomState },
}
