return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.api.nvim_exec(
      [[
        function OpenMarkdownPreview (url)
          execute "silent ! open -a Firefox -n --args --new-window " . a:url
        endfunction
        let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      ]],
      false
    )

    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
