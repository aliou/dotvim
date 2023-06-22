local desc = "not supported for current buffer"
local print_message = function()
  vim.notify(desc, vim.log.levels.WARN, { prefix = "ad.lsp" })
end

vim.keymap.set("n", "<leader>ca", print_message, { desc = desc , buffer = false })
vim.keymap.set("v", "<leader>ca", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>ct", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>af", print_message, { desc = desc , buffer = false })
vim.keymap.set("n", "<leader>rn", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<C-\\>", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>ll", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>li", print_message, { desc = desc , buffer = false })
