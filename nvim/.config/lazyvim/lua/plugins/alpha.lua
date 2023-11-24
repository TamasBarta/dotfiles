return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      require("alpha")
      require("alpha.term")
      local dashboard = require("alpha.themes.dashboard")

      local width = 40
      local height = 6
      dashboard.section.terminal.command = "neo --fps=20 --speed=7 -D -m 'NEOVIM' -d 0.7 -l 1,1"
      dashboard.section.terminal.width = width
      dashboard.section.terminal.height = height
      dashboard.section.terminal.opts.redraw = true

      dashboard.config.layout = {
        { type = "padding", val = 1 },
        dashboard.section.terminal,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      return dashboard
    end,
  },
}
