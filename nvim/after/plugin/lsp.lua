local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"volar"},
  handlers = {
    function(server_name)
      local server_config = {}


      if server_name == "volar" then
        server_config.filetypes = { 'vue', 'typescript', 'javascript' }
    end


      require('lspconfig')[server_name].setup(server_config)
    end,
  },
})

local lspconfig = require('lspconfig')

lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
