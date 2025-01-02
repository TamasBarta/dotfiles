return {
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      appearance = {
        -- nerd_font_variant = "Nerd Font Mono",
      },
      completion = {
        list = {
          selection = "manual",
        },
        menu = {
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              { "source_name" },
            },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "enter",
        ["<C-y>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
    },
  },
}
