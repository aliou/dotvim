local lint = require('lint')

lint.linters_by_ft = {
  go = { "golangcilint" },
  javascript = { "eslint_d" },
  ruby = { "rubocop" },
  sh = { "shellcheck" },
  typescript = { "eslint_d" },
}

local setup = function(augroup)
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = augroup, pattern = "*", callback = function()
      lint.try_lint()
    end,
    desc = '[diagnostic] Lint on file write',
  })
end

return {
  setup = setup
}
