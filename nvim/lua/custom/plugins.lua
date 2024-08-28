local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    opts = {
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
marksman = {},
              -- Ensure mason installs the server
        clangd = {
          keys = {
            { "<leader>csh", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=Chromium",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
    },
  },
  {
    "sqls-server/sqls.vim",
  },
  {
    "sindrets/diffview.nvim",
    event = 'VeryLazy',
  },
  {
  "whleucka/reverb.nvim",
  event = "BufReadPre",
    opts = {
      sounds = {
        -- add custom sound paths for other events here
        -- eg. EVENT = "/some/path/to/sound.mp3"
        -- BufRead = { path = sound_dir .. "start.ogg", volume = 0-100 },
        -- CursorMovedI = { path = sound_dir .. "click.ogg", volume = 0-100 },
        -- InsertLeave = { path = sound_dir .. "toggle.ogg", volume = 0-100 },
        -- ExitPre = { path = sound_dir .. "exit.ogg", volume = 0-100 },
        -- BufWrite = { path = sound_dir .. "save.ogg", volume = 0-100 },
        -- BufRead = { path = "/home/ard/Downloads/kenney_interface-sounds/Audio/confirmation_001.ogg", volume = 100 },
        -- CursorMovedI = { path = "/home/ard/Downloads/kenney_interface-sounds/Audio/click.ogg", volume = 0-100 },
        -- InsertLeave = { path = "/home/ard/Downloads/kenney_interface-sounds/Audio/toggle_001.ogg", volume = 100 },
        ExitPre = { path = "/home/ard/Downloads/kenney_interface-sounds/Audio/bong_001.ogg", volume = 0-100 },
        -- BufWrite = { path = "/home/ard/Downloads/kenney_interface-sounds/Audio/save.ogg", volume = 0-100 },
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
        },
      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- -@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "tpope/vim-dadbod",
    cmd = "DB",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    keys = {
      { "<leader>B", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
    init = function()
      local data_path = vim.fn.stdpath("data")

      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true

      -- NOTE: The default behavior of auto-execution of queries on save is disabled
      -- this is useful when you have a big query that you don't want to run every time
      -- you save the file running those queries can crash neovim to run use the
      -- default keymap: <leader>S
      vim.g.db_ui_execute_on_save = false
    end,
  },
  {
    "tpope/vim-obsession",
    event = "VeryLazy",
    config = function()
      vim.g.obsession_signs = {
        { hl = "DiagnosticSignError", text = "❌" },
        { hl = "DiagnosticSignWarn", text = "⚠️" },
        { hl = "DiagnosticSignHint", text = "💡" },
        { hl = "DiagnosticSignInfo", text = "ℹ️" },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "rust-analyzer",
        -- "esbonio",
        "clangd",
        "clang-format",
        "java-debug-adapter",
        "java-test",
        "sqlfluff",
        -- "r-languageserver",
        "basedpyright",
        "pyright",
        "mypy",
        "debugpy",
        "sqls",
        "typescript-language-server",
        "js-debug-adapter",
        "codelldb",
        "lua-language-server",
        -- svelte
        "svelte-language-server",
        "cmakelang",
        "cmakelint",
        "hadolint", -- Dockerfile linter
        "markdownlint-cli2",
        "markdown-toc",
      },
    },
  },
  -- {
  --   "nvim-java/nvim-java"
  -- },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function()  -- Mapping tab is already used by NvChad
  --     -- vim.g.copilot_no_tab_map = true;
  --     vim.g.copilot_assume_mapped = true;
  --     vim.g.copilot_tab_fallback = "";
  --   -- The mapping is set to other key, see custom/lua/mappings
  --   -- or run <leader>ch to see copilot mapping section
  --   end
  -- },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-]>",
          clear_suggestion = "<C-0>",
          accept_word = "<C-j>",
        },
      })
    end,
    lazy = false,
  },
  {
    "Civitasv/cmake-tools.nvim",
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = 'java'
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function ()
      require "custom.configs.rustaceanvim"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>ld",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>lX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>lL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>lQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function ()
      require "custom.configs.dap"
      require ("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "nvim-neotest/nvim-nio"
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    }
  },
  {
    'krisajenkins/telescope-docker.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('telescope').load_extension('telescope_docker')
        require('telescope_docker').setup {}
    end,

    -- Example keybindings. Adjust these to suit your preferences or remove
    --   them entirely:
    keys = {
        {
            '<Leader>dv',
            ':Telescope telescope_docker docker_volumes<CR>',
            desc = '[D]ocker [V]olumes',
        },
        {
            '<Leader>di',
            ':Telescope telescope_docker docker_images<CR>',
            desc = '[D]ocker [I]mages',
        },
        {
            '<Leader>dp',
            ':Telescope telescope_docker docker_ps<CR>',
            desc = '[D]ocker [P]rocesses',
        },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style", "{BasedOnStyle: Chromium, ColumnLimit: 120}" },
        }),
      },
      })
    end
  }
}
return plugins
