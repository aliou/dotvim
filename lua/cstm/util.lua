local DEFAULT_MAP_OPTIONS = { noremap = true, silent = true, buffer = true }

local map = function(mode, key, result, options)
  options = options or {}

  local map_options = vim.tbl_extend('force', DEFAULT_MAP_OPTIONS, options)
  local only_for_buffer = map_options.buffer

  map_options.buffer = nil

  if only_for_buffer then
    vim.api.nvim_buf_set_keymap(0, mode, key, result, map_options)
  else
    vim.api.nvim_set_keymap(mode, key, result, map_options)
  end
end

local get_buf_filetypes = function()
  return vim.split(vim.api.nvim_buf_get_option(0, 'filetype'), '.', true)
end

local current_buf_has_filetype = function(filetype)
  return vim.tbl_contains(get_buf_filetypes(), filetype)
end

local print_err = print

return {
  current_buf_has_filetype = current_buf_has_filetype,
  get_buf_filetypes = get_buf_filetypes,
  map = map,
  print_err = print_err
}
