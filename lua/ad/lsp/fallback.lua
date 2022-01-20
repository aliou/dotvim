local desc = "[lsp] not supported for current buffer"
local print_message = function()
  print(desc)
end

vim.keymap.set("n", "<leader>ca", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>ct", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>af", print_message, { desc = desc , buffer = false })
vim.keymap.set('n', '<leader>ht', print_message, { desc = desc , buffer = false })
vim.keymap.set("n", "<leader>rn", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<C-\\>", print_message, { desc = desc , buffer = false })

vim.keymap.set("n", "<leader>ll", print_message, { desc = desc , buffer = false })

return {
  print_message = print_message
}
