-- vim.cmd [[ compiler tsc ]]
-- vim.bo.makeprg = "npx tsc"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
