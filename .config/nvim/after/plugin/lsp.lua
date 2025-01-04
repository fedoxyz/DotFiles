local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'volar', 'tsserver', 'pyright'},
  handlers = {
    lsp_zero.default_setup,
    volar = function()
      require('lspconfig').volar.setup({
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      })
    end,
    -- Add a custom handler for Pyright
    pyright = function()
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportAttributeAccessIssue = "none",
                reportGeneralTypeIssues = "none"
              }
            }
          }
        }
      })
    end,
  },
})
