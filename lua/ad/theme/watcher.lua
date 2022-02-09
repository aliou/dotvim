local callbacks = require('ad.theme.callbacks')

FILE_PATH = '/tmp/.cstm.theme'
DEFAULT_CONFIG = { dark = 'xcodedarkhc', light = 'xcodelighthc' }

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

  return "dark"
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
    vim.notify("theme: error while listening to theme: file was moved or deleted", vim.log.levels.ERROR)
  end

  if err then
    vim.notify("theme: error occured:", vim.log.levels.ERROR)
    vim.notify(vim.inspect(err), vim.log.levels.ERROR)
  end
end

watch_file = function()
  w:start(FILE_PATH, {}, vim.schedule_wrap(on_change))
end

local run = function()
  local initial_theme = read_file()

  update_theme(initial_theme)
  callbacks.execute_on_theme_change(initial_theme)

  watch_file()
end

return {
  run = run,
  read_file = read_file,
}
