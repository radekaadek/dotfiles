local M = {}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
      end,
      "Copilot Accept",
       {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
      }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    }
  }
}

-- trouble.nvim
M.trouble = {
  n = {
    ["<leader>lt"] = {
      function()
        require("trouble").toggle()
      end,
      "Trouble Toggle"
    },
    ["<leader>lw"] = {
      function()
        require("trouble").toggle("workspace_diagnostics")
      end,
      "Trouble Workspace Diagnostics"
    },
    ["<leader>ld"] = {
      function()
        require("trouble").toggle("document_diagnostics")
      end,
      "Trouble Document Diagnostics"
    },
    ["<leader>lq"] = {
      function()
        require("trouble").toggle("quickfix")
      end,
      "Trouble Quickfix"
    },
    ["<leader>ll"] = {
      function()
        require("trouble").toggle("loclist")
      end,
      "Trouble Loclist"
    },
    ["gR"] = {
      function()
        require("trouble").toggle("lsp_references")
      end,
      "Trouble LSP References"
    }
  }
}

-- Lua

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "TmuxNavigateLeft"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "TmuxNavigateDown"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "TmuxNavigateUp"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "TmuxNavigateRight"},
  }
}

return M
