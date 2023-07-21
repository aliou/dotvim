local formatter = require('formatter')
local util = require('formatter.util')

local autocmd = require('ad.format.autocmd')

local jq = function()
  return {
    exe = "jq",
    args = { "." },
    stdin = true,
  }
end


formatter.setup({
  logging = vim.log.level <= vim.log.levels.DEBUG,
  log_level = vim.log.levels.DEBUG,

  -- TODO: eslint_d, swiftformat, rubocop through rubocop-deamon
  filetype = {
    json = { jq },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    }
  },
})

vim.keymap.set("n", "<leader>af", ":Format<CR>", {
  silent = true,
  desc = '[format] Format current file',
  buffer = false,
})

local augroup = vim.api.nvim_create_augroup('ad.format', { clear = true })
autocmd.setup(augroup)
