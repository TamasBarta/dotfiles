return {
  {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/neotest-jest",
    },
    opts = function(_, opts)
      opts = opts or {}
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        })
      )
    end,
  },
}
