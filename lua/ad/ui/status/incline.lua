local status = require('cstm.status')
local incline = require('incline')

local render = function(props)
  local name = vim.api.nvim_buf_get_name(props.buf)
  if name == '' then
    name = '[No Name]'
  else
    name = vim.fn.fnamemodify(name, ':~:.')
  end

  local result = { { name } }

  if vim.api.nvim_buf_get_option(props.buf, 'modified') then
    table.insert(result, 1, { '[+] ' })
  end

  local buf_status = vim.b[props.buf].status_value
  if buf_status ~= status.in_progress then
    table.insert(result, { ' ' .. buf_status, group = status.highlight(props.buf) })
  end

  return result
end

incline.setup({
  render = render,
  window = {
    margin = {
      horizontal = 0,
    }
  },
  ignore = {
    buftypes = {},
  },
  hide = {
    cursorline = 'focused_win'
  }
})
