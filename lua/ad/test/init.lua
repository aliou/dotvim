local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-jest')({}),
  },
  output = {
    enabled = true,
    open_on_run = true,
  },

  summary = {
  },
})

vim.keymap.set('n', '<leader>rt', function()
  neotest.run.run()
end)

vim.keymap.set('n', '<leader>rT', function()
  -- TODO: alternate?
  neotest.run.run(vim.fn.expand("%"))
end)
