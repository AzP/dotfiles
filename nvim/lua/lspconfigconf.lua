local lspconfig = require('lspconfig')

---- Setup lsp defaults combined with cmp
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
  )

lspconfig.pyright.setup({})
lspconfig.bashls.setup({})
lspconfig.sumneko_lua.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        }
      }
    }
  })
lspconfig.bashls.setup({})
lspconfig.clangd.setup({})
