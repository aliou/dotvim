local map = require('cstm.util').map
local temporary_register = 'z'
local command_format = 'noautocmd normal gv"%sy'

local direction_validator = function(direction)
  if direction == 'backward' then return true end
  if direction == 'forward' then return true end

  return false
end

local normalize_term = function(term)
  return vim.fn.substitute(
    vim.fn.escape(term, [[\]]),
    [[\n]], [[\\n]], 'g'
  )
end

-- TODO: allow passing an additional parameter to customize the selection
-- content. e.g., for bash, update the selection to add an optional prefix `$`
-- to handle searching for both a variable being defined and used.
-- ex. calling the function with this argument, would search for 'toto' and
-- '$toto'.
local run = function(direction, ...)
  local _ = select('#', ...) -- Get the additional parameter from here.

  vim.validate {
    direction = {
      direction,
      direction_validator,
      "one of 'backward' or 'forward'",
    }
  }

  -- Save current content of the temporary register.
  local previous_value = vim.registers[temporary_register]

  -- Copy the current visual selection into our register.
  local command = string.format(command_format, temporary_register)
  vim.cmd(command)

  -- Set very nomagic to the search. See help /magic.
  local term = '\\V' .. normalize_term(vim.registers[temporary_register])

  -- Set the search register.
  vim.registers['/'] = term

  -- Restore the content of temporary register.
  vim.registers[temporary_register] = previous_value

  -- Execute the search in the correct direction.
  if direction == 'forward' then
    vim.cmd('//')
  else
    vim.cmd('??')
  end
end

map('v', '*', "<cmd> lua require('ad.visual_search').run('forward')<CR>", { noremap = true })
map('v', '#', "<cmd> lua require('ad.visual_search').run('backward')<CR>", { noremap = true })

return {
  run = run
}
