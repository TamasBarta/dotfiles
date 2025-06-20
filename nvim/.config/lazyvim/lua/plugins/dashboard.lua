return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣼⣿⣷⠦⠀⠀⡴⣲⣒⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣀⣠⣤⣤⣄⢀⣴⣿⣿⡟⠁⠀⣰⣦⣙⠛⠛⠋⢀⣦⣀⠀⠀⣀⣤⣦⣀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣄⠀⢠⡀⠀⠀⠀
⠀⠀⣠⣴⣿⣿⡿⠿⢟⣿⣿⣿⡿⠋⠀⣠⣾⣿⣿⠟⠁⢀⣴⣿⣿⣿⣵⣿⣿⣿⣿⣿⡇⠀⢀⣴⣾⣿⣿⠿⠟⣿⣷⣿⣿⡷⠂⠀
⠀⣴⣿⣿⡿⠋⠀⢀⣼⣿⣿⠟⠁⢀⣴⣿⣿⡿⠁⠀⣰⣿⣿⣿⡿⠟⠋⢉⣼⣿⣿⠟⠀⣰⣿⣿⡿⠋⠀⢀⣴⣿⣿⡿⠋⠀⠀⣀
⢸⣿⣿⣿⣤⣴⣾⣿⣿⣿⣯⣶⣶⣿⣿⣿⣯⣴⣶⣾⣿⣿⡿⠉⠀⢀⣴⣿⣿⣿⣧⣶⣾⣿⣿⣿⣥⣴⣶⣿⣿⣿⣿⣵⣶⣾⣿⡿
⠀⠉⠻⠿⠿⠟⠛⠉⠻⠿⠟⠛⠋⠙⠿⠿⠿⠛⠋⠛⠻⠿⠁⠀⠀⠉⠛⠿⠿⠿⠛⠋⠉⠉⠛⠿⠿⠟⠛⠉⠛⠿⠿⠛⠋⠉⠀⠀
    ]],
      },
      sections = {
        {
          section = "header",
          padding = 1,
        },
        {
          section = "terminal",
          cmd = 'chafa "$(readlink -f ~/Pictures/Wallpaper)" --format symbols --symbols vhalf --size 60x13 --stretch; sleep .1',
          height = 13,
          padding = 2,
        },
        -- { section = "startup" },
        {
          section = "keys",
          pane = 2,
          gap = 1,
          padding = 3,
        },
        -- { pane = 2, gap = 1, section = "recent_files", padding = 1 },
      },
    },
  },
}
