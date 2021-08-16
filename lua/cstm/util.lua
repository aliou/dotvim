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

local print_err = print

-- Extract into own file when this becomes too big.
local fn
fn = {
  uniq = function(t)
    local uniq_items = {}
    for _, v in pairs(t) do
      if not uniq_items[v] then
        uniq_items[v] = true
      end
    end

    local result = {}
    for k, _ in pairs(uniq_items) do
      table.insert(result, k)
    end

    return result
  end,

  sort = function(t)
    return vim.fn.sort(vim.fn.copy(t))
  end,

  -- TODO: Allow keeping the keys?
  filter = function(t, func)
    local filtered_args = {}

    for _, v in ipairs(t) do
      if func(v) then table.insert(filtered_args, v) end
    end

    return filtered_args
  end,

  compact = function(t)
    local filter = function(v)
      return v ~= "" and (not (not v))
    end

    return fn.filter(t, filter)
  end,

  map = function(t, func)
    local result = {}
    for k, v in pairs(t) do
      result[k] = func(v)
    end

    return result
  end,
}

return {
  fn = fn,
  map = map,
  print_err = print_err,
}
