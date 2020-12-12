local map = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

return {
  map = map
}
