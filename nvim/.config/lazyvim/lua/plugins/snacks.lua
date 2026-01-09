return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
      },
      picker = {
        hidden = true, -- for hidden files
        ignored = false, -- for .gitignore files
        sources = {
          files = {
            hidden = true,
          },
        },
      },
    },
  },
}
