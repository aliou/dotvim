local cmp = require('cmp')

-- menuone: Display popup menu for a single entry, so we can see the floating
-- window.
-- noinsert: Don't insert text until a match is selected to handle async
-- filling of the menu.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

cmp.setup({
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
    },
    {
      { name = 'copilot' },
      { name = 'buffer' },
      { name = 'path' },
    }
  ),
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm()
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  formatting = {
    format = function(entry, vim_item)
      local client = entry.source.source.client
      local client_name = ''

      if client then
        client_name = client.name
      else
        client_name = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
        })[entry.source.name]
      end

      vim_item.menu = client_name

      return vim_item
    end,
  },
})
