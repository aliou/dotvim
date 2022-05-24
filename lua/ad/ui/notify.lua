vim.log.level = vim.log.levels.INFO

local default_log_options = {}

-- NOTE: This might not be a good idea.
local ignored_messages = {}
ignored_messages['No code actions available'] = true

local prefix_message = function(prefix, message)
  if not prefix then
    return message
  end

  return string.format("[%s] %s", prefix, message)
end

return function(msg, level, options)
  options = options or default_log_options
  level = level or vim.log.level

  if ignored_messages[msg] then return end

  if vim.log.level > level then
    return
  end

  local message = prefix_message(options.prefix, msg)

  if level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(message)
  elseif level == vim.log.levels.WARN then
    vim.api.nvim_echo({{message, 'WarningMsg'}}, true, {})
  else
    vim.api.nvim_echo({{message}}, true, {})
  end
end
