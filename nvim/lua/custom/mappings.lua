local M = {}

-- M.copilot = {
--   i = {
--     ["<C-l>"] = {
--       function()
--         vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
--       end,
--       "Copilot Accept",
--        {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
--       }
--   }
-- }

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
