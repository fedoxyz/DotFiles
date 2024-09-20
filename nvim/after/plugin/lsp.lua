local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
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
  },
})

local lspconfig = require('lspconfig')

-- Add this configuration for Python
lspconfig.pyright.setup{}
