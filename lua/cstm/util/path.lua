local api = vim.api
local M = {}

local path_separator = "/"

-- Directly copied from null-ls.

M.path = {
  exists = function(filename)
    local stat = vim.loop.fs_stat(filename)
    return stat ~= nil
  end,
  join = function(...)
    return table.concat(vim.tbl_flatten({ ... }), path_separator):gsub(path_separator .. "+", path_separator)
  end,
}

M.root_pattern = function(...)
  local patterns = vim.tbl_flatten({ ... })

  local function matcher(path)
    if not path then
      return nil
    end

    -- escape wildcard characters in the path so that it is not treated like a glob
    path = path:gsub("([%[%]%?%*])", "\\%1")
    for _, pattern in ipairs(patterns) do
      ---@diagnostic disable-next-line: param-type-mismatch
      for _, p in ipairs(vim.fn.glob(M.path.join(path, pattern), true, true)) do
        if M.path.exists(p) then
          return path
        end
      end
    end

    return nil
  end

  return function(start_path)
    local start_match = matcher(start_path)
    if start_match then
      return start_match
    end

    for path in vim.fs.parents(start_path) do
      local match = matcher(path)
      if match then
        return match
      end
    end
  end
end

return M
