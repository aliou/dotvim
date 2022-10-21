local M
M = {
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

  compact = function(t)
    local filter = function(v)
      return v ~= "" and (not (not v))
    end

    return M.filter(t, filter)
  end,

  indexOf = function(t, v)
    for index, value in ipairs(t) do
      if value == v then return index end
    end

    return nil
  end,

  first = function(t, fn)
    for _, value in pairs(t) do
      if fn(value) then return value end
    end

    return nil
  end,
}

return M
