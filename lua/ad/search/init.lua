local grep_string = function (_)
  vim.notify('NOT IMPLEMENTED', vim.log.levels.ERROR)
end

-- TODO: State to allow history navigation and completion.
-- TODO: Toggle regexp: on keymap toggle regex and update input title (like
-- appending a (r) to the top text of the input).

local on_submit = function(term)
  -- Cleanup term.
  term = term or ""
  term = vim.trim(term)
  if not term or #term == 0 then return end

  -- Execute search in the background.
  grep_string({ search = term })
end

local exec = function(term)
  -- Fallback to word under cursor if no term is given.
  -- TODO: Try to have this work differently depending on the language (thanks
  -- to treesitter?).
  if not term or #term == 0 then
    term = vim.fn.expand("<cword>")
  end

  -- TODO: Update (vim|ad).ui.input to allow additional configuration of
  -- nui.input. (in particular adding keymaps for history and other options, see
  -- above).

  local options = {
    prompt = "Search: ",
    default = term,
  }
  vim.ui.input(options, on_submit)
end

vim.cmd [[
  nnoremap <silent> <leader>s <cmd>lua require('ad.search').exec()<cr>
]]

return {
  exec = exec
}
