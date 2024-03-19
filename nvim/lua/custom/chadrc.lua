---@type ChadrcConfig
local M = {}

M.ui = { theme = 'gatekeeper' }
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'

-- set relative path numbers as default

vim.opt.relativenumber = true

return M
