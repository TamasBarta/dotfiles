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
    opts = {
      servers = {
        gdscript = {
          name = "godot",
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        },
      },
      setup = {
        gdscript = function(_, opts)
          require("lspconfig").gdscript.setup(vim.tbl_extend("force", opts, {
            on_init = function(_, _)
              vim.fn.serverstart("/tmp/godot.pipe")
            end,
          }))
          return true
        end,
      },
    },
  },
}
