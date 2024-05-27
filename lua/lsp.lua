-- Mason setup
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'tsserver' },
})

-- LSP settings
local lspconfig = require('lspconfig')

-- Setup capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Pyright for Python
lspconfig.pyright.setup({
  capabilities = capabilities,
})

-- TSServer for JavaScript/TypeScript
lspconfig.tsserver.setup({
  capabilities = capabilities,
})

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

