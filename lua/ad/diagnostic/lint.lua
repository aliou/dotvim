local lint = require('lint')

lint.linters_by_ft = {
  sh = { "shellcheck" }
}

local setup = function(augroup)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = augroup, pattern = "*", callback = function()
      lint.try_lint()
    end,
    desc = '[diagnostic] Setup nvim-lint in buffer',
  })
end

return {
  setup = setup
}
