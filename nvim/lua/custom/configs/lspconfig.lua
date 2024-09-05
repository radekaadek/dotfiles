-- Setup language servers.
local base = require('plugins.configs.lspconfig')
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require('lspconfig')
-- Configure Treesitter
local ts_configs = require('nvim-treesitter.configs')
ts_configs.setup {
  auto_install = true,
}

lspconfig.basedpyright.setup {
  capabilities = capabilities,
  settings = {
    basedpyright = {
      typeCheckingMode = "standard",
    },
  },
}
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = false,
    }
  }
}
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    -- Disable clangd formatting if you plan on formatting via efm
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

lspconfig.sqls.setup {
  on_attach = on_attach,
}

-- lspconfig.esbonio.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

