local READLINE_FILENAME_START = 'bash-fc'
local filename = vim.fn.expand('%:t')

-- If we're in readline's edit-and-execute-command mode (<c-x><c-e>):
--   - Enable paste mode,
--   - Disable textwidth to allow pasting lines longer than `&tw`.
if vim.startswith(filename, READLINE_FILENAME_START) then
  vim.o.paste = true
  vim.bo.textwidth = 0
end
