require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" , "basedpyright", "clangd", "ts_ls", "jsonls", "svelte",
                  "yamlls", "rust_analyzer", "cmake", "sqls", "bashls", "dockerls", "jdtls",
                  "kotlin_language_server"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }


lspconfig.basedpyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    basedpyright = {
      typeCheckingMode = "basic"
    }
  }
}
