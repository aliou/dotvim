local change_fns = {}
local on_theme_change = function(fn)
  table.insert(change_fns, fn)
end

local execute_on_theme_change = function(theme)
  for i = 1, #change_fns do
    change_fns[i](theme)
  end
end

return {
  execute_on_theme_change = execute_on_theme_change,
  on_theme_change = on_theme_change,
}
