---@type ChadrcConfig
local M = {}

M.ui = { theme = 'tokyodark' }
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'

-- set relative path numbers as default

vim.opt.relativenumber = true

return M
