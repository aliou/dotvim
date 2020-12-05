local api = vim.api
local buf = vim.lsp.buf

local window = require('cstm.floating').window

local prompt = function(current_name)
  local bufnr = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(bufnr, 0, -1, true, {"", " " .. current_name})

  local options = {
    height = 0.1,
    width = 0.2, -- Formula with current_name's length
    start_insert = true,
    enter_window = true,
    with_frame = true,
    bufnr = bufnr
  }

  window.create(options)
end

local rename = function()
  local current_name = vim.fn.expand('<cword>')
  if not (current_name and #current_name > 0) then return end

  local new_name = prompt(current_name)
  print(new_name)
  -- buf.rename(new_name)
end

return {
  rename = buf.rename,
  new_rename = rename,
}
