local print_err = require('cstm.util').print_err

FILE_PATH = '/tmp/.cstm.theme'
DEFAULT_CONFIG = { dark = 'xcodedarkhc', light = 'xcodelighthc' }

local change_fns = {}
local on_theme_change = function(fn)
  table.insert(change_fns, fn)
end

local execute_on_theme_change = function(theme)
  for i = 1, #change_fns do
    change_fns[i](theme)
  end
end

local update_theme = function(new_scheme)
  if new_scheme == "" then return end

  local current_theme = vim.g.colors_name
  local next_theme

  local configuration = vim.g.colors or DEFAULT_CONFIG

  next_theme = configuration[string.lower(new_scheme)]
  if next_theme ~= current_theme then
    vim.api.nvim_command("colorscheme " .. next_theme)
  end
end

local read_file = function()
  local ok, value = pcall(vim.fn.readfile, FILE_PATH)
  if ok and #value == 1 then
    return value[1]
  end

  return ""
end

local w = vim.loop.new_fs_event()
local watch_file
local on_change = function(err, _, status)
  w:stop()

  if status["change"] then
    local new_scheme = read_file()
    update_theme(new_scheme)
    watch_file()
    return
  end

  if status["rename"] then
    print_err("theme: error while listening to theme: file was moved or deleted")
  end

  if err then
    print_err("theme: error occured:")
    print(vim.inspect(err))
  end
end

watch_file = function()
  w:start(FILE_PATH, {}, vim.schedule_wrap(on_change))
end

-- Start the thing
local watch = function()
  update_theme(read_file())
  watch_file()
end

-- Apply callbacks on colorscheme change.
vim.cmd [[augroup ad.theme]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd ColorScheme * :lua require('ad.theme').execute_on_theme_change(vim.fn.expand('<amatch>'))]]
vim.cmd [[augroup END]]

return {
  execute_on_theme_change = execute_on_theme_change,
  on_theme_change = on_theme_change,
  watch = watch,
}
