--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "catppuccin"
lvim.builtin.alpha.dashboard.section.header.val = {
  "                                                  ",
  "                          ,,,,                    ",
  "              ******      ///////////             ",
  "              ********,   /////////////           ",
  "              **********  ///////////////         ",
  "              **********  ////////////////        ",
  "        ////////////////  ////////////////        ",
  "         ///////////////  ////////////////        ",
  "          //////////////  ///////////////         ",
  "           ,////////////  //////////////          ",
  "              //////////  ///////////             ",
  "              ****//////  ,,,,,                   ",
  "              **********                          ",
  "              **********                          ",
  "              **********                          ",
  "              **********                          ",
  "              **********                          ",
  "               .********                          ",
  "                  ******                          ",
  "      ____                 _       _              ",
  "     |  _ \\ ___  _ __     | | ___ | |__  _ __     ",
  "     | |_) / _ \\| '_ \\ _  | |/ _ \\| '_ \\| '_ \\    ",
  "     |  __/ (_) | |_) | |_| | (_) | | | | | | |   ",
  "     |_|   \\___/| .__/ \\___/ \\___/|_| |_|_| |_|   ",
  "                |_|                               ",
  "                                                  "
}
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showtabline = 0
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}
lvim.builtin.telescope.extensions["ui-select"] = {
  require("telescope.themes").get_cursor {}
}
lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "ui-select")
end
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["n"] = { '<cmd>lua require"notify".dismiss()<CR>', "Dismiss notifications" }
lvim.builtin.which_key.mappings["Z"] = { "<cmd>ZenMode<CR>", "Zen mode" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}
lvim.builtin.which_key.mappings["r"] = {
  name = "+Rust Tools",
  r = { "<cmd>RustRunnables<cr>", "Runnables" },
  d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
}
lvim.builtin.which_key.mappings["f"] = {
  name = "+Flutter Tools",
  R = { "<cmd>FlutterRun<cr>", "Run" },
  r = { "<cmd>FlutterRestart<cr>", "Restart" },
  q = { "<cmd>FlutterQuit<cr>", "Stop" },
  d = { "<cmd>FlutterVisualDebug<cr>", "Visual Debug" },
  D = { "<cmd>FlutterDevices<cr>", "Devices" },
  o = { "<cmd>FlutterOutlineToggle<cr>", "Toggle Outline" },
  s = { "<cmd>silent exec \"!tmux new -d scrcpy\"<cr>", "scrcpy" },
  c = { "<cmd>FlutterLogClear<cr>", "Clear log" },
  g = { "<cmd>FlutterPubGet<cr>", "Run flutter pub get" },
}
lvim.builtin.which_key.mappings["G"] = {
  name = "+Generation tools",
  d = { '<cmd>lua require"nvim-treesitter-dart-data-class".generate()<cr>', "Generate Dart data class methods" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = '<c-t>'
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.git_hl = false
lvim.builtin.nvimtree.setup.view.width = 45
lvim.builtin.dap.active = true
lvim.builtin.comment.context_commentstring = {
  config = {
    __default = '// %s',
    dart = '// %s'
  }
}
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  -- "dart",
  "javascript",
  "json",
  "kotlin",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- -- Bufferline
-- local flutter_outline_offset = {
--   filetype = "flutterToolsOutline",
--   text = "Flutter Outline",
--   highlight = "Directory",
--   text_align = "center"
-- };

-- table.insert(lvim.builtin.bufferline.options.offsets, flutter_outline_offset)
lvim.builtin.bufferline.active = false

lvim.builtin.breadcrumbs.active = true

-- lvim.builtin.project.manual_mode = true
lvim.builtin.project.detection_methods = { "lsp" }

lvim.builtin.lualine.options.component_separators = { left = '', right = '' }
lvim.builtin.lualine.options.section_separators = { left = '', right = '' }

local components = require("lvim.core.lualine.components")
components.mode.separator = { left = lvim.builtin.lualine.options.section_separators.right }
components.mode.padding.right = 1
components.progress.separator = { right = lvim.builtin.lualine.options.section_separators.left }
components.location.padding = { left = 0, right = 0 }


-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "dartls" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- --`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

lvim.builtin.cmp.sources = vim.tbl_filter(function(source)
  return source.name ~= "buffer"
end, lvim.builtin.cmp.sources)

-- Additional Plugins
lvim.plugins = {
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup()
    end
  },
  { "NoahTheDuke/vim-just" },
  {
    "nvim-treesitter/playground",
    config = function()
      require "nvim-treesitter.configs".setup {
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        }
      }
    end
  },
  { 'edluffy/hologram.nvim' },
  {
    'f-person/auto-dark-mode.nvim',
    config = function()
      local auto_dark_mode = require('auto-dark-mode')
      auto_dark_mode.setup({
        set_dark_mode = function()
          vim.api.nvim_set_option('background', 'dark')
          vim.cmd('Catppuccin mocha')
          io.popen("kitty +kitten themes --reload-in=all --config-file-name=$XDG_CONFIG_HOME/kitty/config-proxy.conf mocha")
        end,
        set_light_mode = function()
          vim.api.nvim_set_option('background', 'light')
          vim.cmd('Catppuccin latte')
          io.popen("kitty +kitten themes --reload-in=all --config-file-name=$XDG_CONFIG_HOME/kitty/config-proxy.conf latte")
        end,
      })
      auto_dark_mode.init()
    end
  },
  {
    'ggandor/leap.nvim',
    config = function()
      local leap = require('leap')
      leap.setup {
        max_phase_one_targets = nil,
        highlight_unlabeled_phase_one_targets = false,
        max_highlighted_traversal_targets = 10,
        case_sensitive = false,
        -- Sets of characters that should match each other.
        -- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
        equivalence_classes = { ' \t\r\n', },
        substitute_chars = {},
        -- Leaving the appropriate list empty effectively disables "smart" mode,
        -- and forces auto-jump to be on or off.
        safe_labels = {},
        -- labels = { . . . },
        special_keys = {
          repeat_search = '<enter>',
          next_phase_one_target = '<enter>',
          next_target = { '<enter>', ';' },
          prev_target = { '<tab>', ',' },
          next_group = '<space>',
          prev_group = '<tab>',
          multi_accept = '<enter>',
          multi_revert = '<backspace>',
        },
      }
      leap.add_default_mappings()
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = { "nvim-telescope/telescope.nvim" },
    disable = not lvim.builtin.telescope.active,
  },
  {
    "lambdalisue/suda.vim"
  },
  {
    "jbyuki/instant.nvim",

    config = function()
      vim.g.instant_username = "tamas";
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
          -- height and width can be:
          -- * an absolute number of cells when > 1
          -- * a percentage of the width / height of the editor when <= 1
          -- * a function that returns the width or the height
          width = 120, -- width of the Zen window
          height = 1, -- height of the Zen window
          -- by default, no options are changed for the Zen window
          -- uncomment any of the options below, or add other vim.wo options you want to apply
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false, -- disable whitespace characters
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
          },
          kitty = {
            enabled = false,
            font = "+4", -- font size increment
          },
        },
      }
    end
  },
  {
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup({ mappings_style = "surround" })
    end,
  },
  { "chazmcgarvey/vim-mermaid" },
  { "rhysd/vim-grammarous" },
  { "marko-cerovac/material.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "tridactyl/vim-tridactyl" },
  {
    "akinsho/flutter-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      -- alternatively you can override the default configs
      require("flutter-tools").setup({
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = true,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = true,
          },
        },
        debugger = { -- integrate with nvim dap + install dart code debugger
          enabled = true,
          run_via_dap = false,
        },
        -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
        flutter_lookup_cmd = "asdf where flutter", -- example "dirname $(which flutter)" or "asdf where flutter"
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          -- highlight = "ErrorMsg", -- highlight for the closing tag
          prefix = "</", -- character to use for close tag e.g. > Widget
          enabled = true, -- set to false to disable
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit", -- command to use to open the log buffer
          -- open_cmd = "10new", -- command to use to open the log buffer
        },
        dev_tools = {
          autostart = false, -- autostart devtools server if not detected
          auto_open_browser = true, -- Automatically opens devtools in the browser
        },
        outline = {
          open_cmd = "50vnew", -- command to use to open the outline buffer
          auto_open = false, -- if true this will open the outline automatically when it is first populated
        },
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
          },
        },
        -- I don't know if this works or not
        root_pattern = { ".git" },
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          cmd = { "rustup", "run", "stable", "rust-analyzer" },
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
        },
      })
    end,
    ft = { "rust", "rs" },
  },
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "mattn/vim-gist",
    event = "BufRead",
    requires = "mattn/webapi-vim",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.7"),
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
              -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
        }
      })
    end
  },
  {
    "tamasbarta/nvim-treesitter-dart-data-class"
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands = {
  {
    "BufWinEnter",
    {
      pattern = "*.lua",
      command = "setlocal ts=2 sw=2"
    }
  },
  {
    "FileType",
    {
      pattern = "markdown",
      command = "setlocal nospell"
    }
  },
}
vim.api.nvim_del_augroup_by_name('_auto_resize')
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false
