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

-- save if compiler is open
local compiler_saved = false
M.compiler = {
--   -- Open compiler
-- vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
--
-- -- Redo last selected option
-- vim.api.nvim_set_keymap('n', '<S-F6>',
--      "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
--   .. "<cmd>CompilerRedo<cr>",
--  { noremap = true, silent = true })
--
-- -- Toggle compiler results
-- vim.api.nvim_set_keymap('n', '<S-F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
  plugin = true,
  n = {
    ["<F6>"] = { "<cmd>CompilerOpen<cr>", "CompilerOpen" },
    ["<F7>"] = { "<cmd>CompilerToggleResults<cr>", "CompilerToggleResults" },
    ["<F8>"] = { "<cmd>CompilerStop<cr>", "CompilerStop" },
    ["<F9>"] = { "<cmd>CompilerRestart<cr>", "CompilerRestart" },
  }
}


return M
