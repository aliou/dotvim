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

  compact = function(t)
    local filter = function(v)
      return v ~= "" and (not (not v))
    end

    return fn.filter(t, filter)
  end,

  indexOf = function(t, v)
    for index, value in ipairs(t) do
      if value == v then return index end
    end

    return nil
  end,
}

local files = {
  is_readable = function(filename)
    local file = io.open(filename, 'r')

    if file ~= nil then
      io.close(file)
      return true
    end

    return false
  end
}

return {
  files = files,
  fn = fn,
}
