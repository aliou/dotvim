local PSQL_EDIT_FILENAME_START = 'psql.edit'
local filename = vim.fn.expand('%:t')

-- If we're in readline's edit-and-execute-command mode (<c-x><c-e>):
--   - Disable textwidth to allow pasting lines longer than `&tw`.
if vim.startswith(filename, PSQL_EDIT_FILENAME_START) then
  vim.bo.textwidth = 0
end
