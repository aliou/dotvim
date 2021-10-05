local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local grep_string = require('telescope.builtin').grep_string

-------------------------------------------------

-- TODO: State to allow history navigation and completion.
-- TODO: Toggle regexp: on keymap toggle regex and update input title (like
-- appending a (r) to the top text of the input).

local on_submit = function(term)
  -- Cleanup term.
  term = vim.trim(term)
  if not term or #term == 0 then return end

  -- Execute search in the background.
  grep_string({ search = term })
end

local on_close = function()
  -- Get back to normal mode when closing the Input.
  vim.cmd('stopinsert')
end

-------------------------------------------------

local input_options = {
  border = {
    style = "rounded",
    text = { top = "[Search]", },
  },
  relative = "editor",
  position = "50%",
  size = { width = 30, height = 2 },
}

local start = function()
  local input = Input(input_options, {
    default_value = " ",
    on_submit = on_submit,
    on_close = on_close,
  })

  input:mount()

  -- close on <esc> in normal mode
  input:map("i", "<esc>", input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

vim.api.nvim_exec([[
  nnoremap <silent> <leader>s <cmd>lua require('ad.search').start()<cr>
]], true)

return {
  start = start
}
