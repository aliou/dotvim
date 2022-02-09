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
}

return {
  fn = fn,
}
