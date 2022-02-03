local callbacks = {}
local on_theme_change = function(description, fn)
  table.insert(callbacks, { fn = fn, description = description })
end

local execute_on_theme_change = function(theme)
  for i = 1, #callbacks do
    local callback = callbacks[i]
    callback.fn(theme)
  end
end

return {
  execute_on_theme_change = execute_on_theme_change,
  on_theme_change = on_theme_change,
}
