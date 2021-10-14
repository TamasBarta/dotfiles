-- ~/.config/lvim/ftplugin/rust.lua
local dap_install = require("dap-install")
dap_install.config("rust", {})

local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

dap.configurations.rust = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
	},
}
