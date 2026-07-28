return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function(_, _)
      return {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- -- This breaks keymaps for lsp
    -- config = function()
    --   vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "markdown",
    --     callback = function()
    --       vim.diagnostic.config({
    --         virtual_text = false,
    --         underline = false,
    --         signs = false,
    --       }, vim.api.nvim_get_current_buf())
    --     end,
    --   })
    -- end,
  },
}
