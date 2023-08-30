local u = require('cstm.util')

vim.opt.exrc = true

-- TODO: Use `vim.secure.read` aka .nvim.lua

-- Source local file if it exists.
if u.files.is_readable(vim.fn.glob('~/.vimrc.local')) then
  local content = vim.secure.read(vim.fn.glob(vim.env.MYLOCALVIMRC))
  if content then
    vim.cmd(content)
  end
end

-- Source project file if it exists.
if u.files.is_readable('.vimrc.local') and vim.fn.getcwd() ~= vim.fn.expand('~') then
  vim.notify("Loading local files manually should be avoided. Rename the file to `.nvimrc`", vim.log.levels.ERROR)
  vim.cmd [[ source .vimrc.local ]]
end

-- Source project file if it exists.
if u.files.is_readable('.vimrc.local.lua') and vim.fn.getcwd() ~= vim.fn.expand('~') then
  vim.notify("Loading local files manually should be avoided. Rename the file to `.nvim.lua`", vim.log.levels.ERROR)
  vim.cmd [[ source .vimrc.local.lua ]]
end
