return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "gdscript",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.gdscript.setup({
        name = "godot",
        cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        on_init = function(_, _)
          vim.fn.serverstart("/tmp/godot.pipe")
        end,
      })
    end,
  },
}
