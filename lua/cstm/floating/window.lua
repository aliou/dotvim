local api = vim.api
local min = vim.fn.min
local max = vim.fn.max

local util = require('cstm.util')

local _opened_windows = {}

local edges = {'╔', '╗', '╚', '╝'}
local default_win_options = {
  width = 0.5,
  height = 0.5,
  enter_window = true,
  start_insert = false
}

local generate_border = function(options)
  local width = options.width
  local height = options.height

  local bar = string.rep('═', width - 2)

  local top = edges[1] .. bar .. edges[2]
  local mid = '║' .. string.rep(' ', width - 2) .. '║'
  local bot = edges[3] .. bar .. edges[4]

  return util.tables.concat({top}, vim.fn['repeat']({mid}, height - 2), {bot})
end

local extract_position = function(dimensions)
  local position = {
    row = 0.5 * (vim.o.lines - dimensions.height),
    col = 0.5 * (vim.o.columns - dimensions.width)
  }

  return position
end

local extract_dimensions = function(options)
  local columns = vim.o.columns
  local lines = vim.o.lines

  local width = options.width > 1 and options.width or
    min({ max({ 0, math.floor(columns * options.width) }), columns })

  local height = options.height > 1 and options.height or
    min({ max({ 0, math.floor(lines * options.height) }), lines })

  return { width = width, height = height }
end

-- For now, only configure floating windows in the center of the current window.
-- In the future, extract this to be able to produce windows relative to the
-- cursor (e.g. popup menus)
local extract_win_config = function(options)
  local dimensions = extract_dimensions(options)
  local position = extract_position(dimensions)

  return util.tables.merge(position, dimensions, {
    relative = 'editor',
    style = 'minimal',
  })
end

local create
local close

local create_frame = function(win_options)
  local frame_options = util.tables.merge(win_options, {
    width = win_options.width + 0.01,
    height = win_options.height + 0.05,
    bufnr = nil,
    with_frame = false,
  })

  local bufnr = api.nvim_create_buf(false, true)
  local border_dim = extract_dimensions(frame_options)
  local border = generate_border(border_dim)

  api.nvim_buf_set_lines(bufnr, 0, -1, true, border)

  return create(util.tables.merge(frame_options, {
    bufnr = bufnr,
    highlight = 'Comment'
  }))
end

-- win_options:
--   width: percentage (0 - 1)
--   height: percentage (0 - 1)
--   start_insert: boolean
--   bufnr: Buffer number
--   highlight: 'Normal' or 'Comment'
create = function(win_options)
  local options = util.tables.merge(default_win_options, (win_options or {}))
  local window_config = extract_win_config(options)

  -- Create frame before creating pricinpal window.
  local frame = win_options.with_frame and create_frame(win_options)

  -- Create buffer if it's not given in the options, and open window with it.
  local bufnr = options.bufnr or api.nvim_create_buf(false, true)
  local win_id = api.nvim_open_win(bufnr, options.enter_window, window_config)

  local highlight = options.highlight or 'Normal'
  vim.fn.setwinvar(win_id, '&winhighlight', 'NormalFloat:' .. highlight)
  vim.fn.setwinvar(win_id, '&colorcolumn', '')

  if options.start_insert then
    vim.cmd [[startinsert]]
  end

  -- Close all windows (including frame) when closing the current window.
  vim.cmd(
    string.format(
      "autocmd WinClosed <buffer=%s> ++once lua require('cstm.floating').window.close(%s)",
      bufnr,
      win_id
    )
  )

  _opened_windows[win_id] = {
    win_id = win_id,
    bufnr = bufnr,
    frame = frame and { win_id = frame.win_id }
  }

  return {
    win_id = win_id,
    bufnr = bufnr
  }
end

close = function(win_id)
  win_id = tonumber(win_id)
  if _opened_windows[win_id] == nil then
    return
  end

  if _opened_windows[win_id].frame then
    api.nvim_win_close(_opened_windows[win_id].frame.win_id, true)
  end

  api.nvim_win_close(win_id, true)
end

return {
  create = create,
  close = close,
}
