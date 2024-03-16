return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }
    vim.list_extend(opts, { sections = { lualine_a = { separator = { left = "" } } } })
    vim.list_extend(opts.sections.lualine_z, { separator = { right = "" } })
    return opts
  end,
}
