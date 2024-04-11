return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.sourcekit = {}
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      if opts.sources == nil then
        opts.sources = {}
      end
      table.insert(opts.sources, nls.builtins.formatting.swiftformat)
      table.insert(opts.sources, nls.builtins.diagnostics.swiftlint)
    end,
  },
}
