local Input = require("nui.input")
local event = require("nui.utils.autocmd").event

local compute_input_options = function(term_length)
  return {
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
      width = term_length + 5,
      height = 1,
    },
  }
end

local rename = function()
  -- Retrieve the word under cursor.
  -- TODO: This can be different based on languages.
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

  local on_close = function()
    -- Get back to normal mode when closing the Input.
    vim.cmd('stopinsert')
  end

  local input = Input(compute_input_options(string.len(current_term)), {
    default_value = current_term,
    on_submit = on_submit,
    on_close = on_close,
    prompt = "",
  })

  input:mount()

  -- close on <esc> in normal mode
  input:map("i", "<esc>", input.input_props.on_close, { noremap = true })

  -- close when cursor leaves the buffer
  input:on(event.BufLeave, input.input_props.on_close, { once = true })
end

return {
  rename = rename
}
