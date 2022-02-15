-- TODO: Replace with Lua 'native' functions instead of calling `vim.fn`.
-- TODO: Figure out if it's possible to create constant variables?

local is_readable = function (path)
  return vim.fn.filereadable(vim.fn.glob(path)) == 1
end

-- Source local file if it exists.
if is_readable('~/.vimrc.local') then
  vim.cmd [[
    let $MYLOCALVIMRC='~/.vimrc.local'
    source $MYLOCALVIMRC
  ]]
end

if is_readable('.vimrc.local') == 1 and vim.fn.getcwd() ~= vim.fn.expand('~') then
  vim.cmd [[ source .vimrc.local ]]
end
