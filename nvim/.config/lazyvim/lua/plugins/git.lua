return {
  {
    "pwntester/octo.nvim",
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
}
