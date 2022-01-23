local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local compute_rename_options = function(term_length)
  local width = 25
  if term_length > 20 then width = term_length + 5 end

  return {
    border = {
      style = "rounded",
      text = { top = "[Rename]" },
    },
    relative = "cursor",
    -- position the popup window on the line below identifier
    position = { row = 1, col = 0 },
    -- 25 cells wide, should be enough for most identifier names
    size = { width = width, height = 2 },
  }
end

local default_options = {
  border = {
    style = "rounded",
    text = { top = "[Search]", },
  },
  relative = "editor",
  position = "50%",
  size = { width = 30, height = 2 },
}

return function(options, on_confirm)
  vim.validate({ on_confirm = { on_confirm, "function", false } })
  local on_close = function() on_confirm(nil) end

  -- We want to have different configuration for nui depending on where it's
  -- called from. However, the only way to differentiate the callee is thanks to
  -- the prompt.
  local input_options = default_options
  if options.prompt == "New Name: " then
    input_options = compute_rename_options(#options.default)
  else
    input_options.border.text.top = options.prompt
  end

  local input = Input(input_options, {
    default_value = options.default,
    on_submit = on_confirm,
    on_close = on_close,
  })

  input:mount()

  -- close on <esc> in insert mode
  input:map("i", "<esc>", input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end
