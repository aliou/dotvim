local merge =  function(...)
  local result = {}

  for i = 1, select('#', ...) do
    local t = select(i, ...)
    for key, value in pairs(t) do
      result[key] = value
    end
  end

  return result
end

local concat =  function(...)
  local result = {}
  local index = 0

  for i = 1, select('#', ...) do
    local table = select(i, ...)
    for _, value in ipairs(table) do
      index = index + 1
      result[index] = value
    end
  end

  return result
end

return {
  merge = merge,
  concat = concat
}
