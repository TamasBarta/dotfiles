return {
  {
    "sindrets/diffview.nvim",
  },
  {
    "pwntester/octo.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = true,
  },
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      require("git-worktree").setup(opts)
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      {
        "<leader>gws",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
      },
      {
        "<leader>gwa",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
      },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    opts = {
      date_format = "%Y-%m-%d %H:%M:%S",
      merge_consecutive = true,
      virtual_style = "float",
      format = function(blame)
        return string.format("%s %s %s", blame.author, blame.date, blame.summary)
      end,
    },
    keys = {
      { "<leader>gB", "<cmd>BlameToggle virtual<cr>", desc = "Blame" },
      { "<leader>gb", "<cmd>BlameToggle window<cr>", desc = "Blame (window)" },
    },
  },
}
