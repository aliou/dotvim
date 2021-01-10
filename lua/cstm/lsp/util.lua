local get_buf_filetypes = function()
  return vim.split(vim.api.nvim_buf_get_option(0, 'filetype'), '.', true)
end

return {
  get_buf_filetypes = get_buf_filetypes
}
