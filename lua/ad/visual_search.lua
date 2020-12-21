local temporary_register = 'z'

-- TODO: allow passing an additional parameter to customize the selection
-- content. e.g., for bash, update the selection to add an optional prefix `$`
-- to handle searching for both a variable being defined and used.
-- ex. calling the function with this argument, would search for 'toto' and
-- '$toto'.
local run = function(direction, ...)
  local _ = select('#', ...) -- Get the additional parameter from here.

  -- TODO: Validate over the possible values of direction.
  vim.validate { direction = { direction, 'string' } }

  -- Save current content of the temporary register.
  local previous_value = vim.registers[temporary_register]

  -- Copy the current visual selection into our register.
  local command = string.format('normal! gv"%sy', temporary_register)
  vim.api.nvim_command(command)
  local raw_selection = vim.registers[temporary_register]
  -- TODO: Simplify this normalization of the register.
  local escaped_selection = vim.fn.escape(raw_selection, [[\]])
  local selection = vim.fn.substitute(escaped_selection, [[\n]], [[\\n]], 'g')

  -- Set the search register to the content of the selection.
  vim.registers['/'] = selection
  local search_flags = 'w'
  if direction == 'backward' then
    search_flags = search_flags .. 'b'
  end
  -- Execute the search.
  vim.fn.search(selection, search_flags)

  -- Restore the content of temporary register.
  vim.registers[temporary_register] = previous_value

  -- Display search matches by highlighting theme.
  vim.api.nvim_command('set hlsearch')
end

vim.api.nvim_set_keymap('v', '*', "<cmd> lua require('ad.visual_search').run('forward')<CR>", { noremap = true })
vim.api.nvim_set_keymap('v', '#', "<cmd> lua require('ad.visual_search').run('backward')<CR>", { noremap = true })

return {
  run = run
}
