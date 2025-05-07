return {
  "christoomey/vim-tmux-navigator",
  enabled = false,
  lazy = false,
  keys = {
    -- n = {
    --   { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
    --   { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
    --   { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
    --   { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
    -- },
  },
  {
    "mrjones2014/smart-splits.nvim",
    enabled = true,
    lazy = false,
    opts = {
      at_edge = "stop",
    },
    keys = {
      n = {
        {
          "<C-h>",
          function()
            require("smart-splits").move_cursor_left()
          end,
          desc = "Navigate Left",
        },
        {
          "<C-j>",
          function()
            require("smart-splits").move_cursor_down()
          end,
          desc = "Navigate Down",
        },
        {
          "<C-k>",
          function()
            require("smart-splits").move_cursor_up()
          end,
          desc = "Navigate Up",
        },
        {
          "<C-l>",
          function()
            require("smart-splits").move_cursor_right()
          end,
          desc = "Navigate Right",
        },
      },
    },
  },
}
