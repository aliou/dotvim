local u = require('cstm.util')

-- Source local file if it exists.
if u.files.is_readable(vim.fn.glob('~/.vimrc.local')) then
  vim.cmd [[ source $MYLOCALVIMRC ]]
end

-- Source project file if it exists.
if u.files.is_readable('.vimrc.local') == 1 and vim.fn.getcwd() ~= vim.fn.expand('~') then
  vim.cmd [[ source .vimrc.local ]]
end
