vim.log.level = vim.log.levels.INFO

local prefix_message = function(prefix, message)
  if not prefix then
    return message
  end

  return string.format("[%s] %s", prefix, message)
end

-- TODO: Ignore some messages, e.g. the "no code action available"
-- TODO: Prefix messages with log level.
return function(msg, level, options)
  -- TODO: Check minimum level (vim.notify_level)
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
