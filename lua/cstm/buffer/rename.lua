local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local rename = function()
  -- Retrieve the word under cursor.
  local current_term = vim.fn.expand('<cword>')
  if current_term == '' then return end

  -- Create the callback function for our input.
  local on_submit = function(new_term)
    -- Don't bother doing anything is the new term is empty or equals the
    -- current term.
    if not new_term or #new_term == 0 then return end
    if current_term == new_term then return end

    -- Let nvim build and send the request to the LSP server.
    vim.lsp.buf.rename(new_term)
  end

  local input_options = {
    -- border for the window
    border = {
      style = "rounded",
      text = {
        top = "[Rename]",
        top_align = "left"
      },
    },
    -- highlight for the window.
    highlight = "Normal:Comment",
    relative = "cursor",
    -- position the popup window on the line below identifier
    position = {
      row = 1,
      col = 0,
    },
    -- 25 cells wide, should be enough for most identifier names
    size = {
      width = 25,
      height = 1,
    },
  }

  local input = Input(input_options, {
    default_value = current_term,
    on_submit = on_submit,
    prompt = "",
  })

  input:mount()

  -- close on <esc> in normal mode
  input:map("n", "<esc>", input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return {
  rename = rename
}
