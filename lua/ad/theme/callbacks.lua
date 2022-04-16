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

local autocmd_callback = function(options)
  execute_on_theme_change(options.match)
end

-- Apply callbacks on colorscheme change.
local augroup = vim.api.nvim_create_augroup('ad.theme', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = augroup, pattern = '*', callback = autocmd_callback,
  desc = '[theme] Execute all callbacks when chaning colorscheme'
})


return {
  execute_on_theme_change = execute_on_theme_change,
  on_theme_change = on_theme_change,
}
