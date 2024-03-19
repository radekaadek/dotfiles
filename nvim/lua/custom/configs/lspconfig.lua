-- Setup language servers.
local base = require('plugins.configs.lspconfig')
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require('lspconfig')
-- Configure Treesitter
local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'html',
    'javascript',
    'json',
    'lua',
    'python',
    'rust',
    'toml',
    'typescript',
    'yaml',
    'sql',
    'r',
    'java',
    'markdown',
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'python'},
}
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = false,
    }
  }
}
lspconfig.sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end,
}
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    -- Disable clangd formatting if you plan on formatting via efm
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
-- lsp for r
lspconfig.r_language_server.setup {
  on_attach = function(client, bufnr)
    -- Disable clangd formatting if you plan on formatting via efm
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
