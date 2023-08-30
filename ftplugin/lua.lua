local u = require('cstm.util')

local runtime_paths = vim.split(package.path, ';')

table.insert(runtime_paths, 'lua/?.lua')
table.insert(runtime_paths, 'lua/?/init.lua')
table.insert(runtime_paths, './?/init.lua')
table.insert(runtime_paths, vim.fn.getenv('VIMRUNTIME') .. '/lua')
table.insert(runtime_paths, vim.fn.expand('~/.vim/lua/?.lua'))

-- TODO: Also include path to packages added by packer.nvim using runtime files.
-- local runtime_files = vim.api.nvim_get_runtime_file('', true)

vim.g.lua_path = runtime_paths

-- TODO: Locally update path so `gf` works.

local filename = vim.fn.expand('%:t')

if u.files.find_in_root('pdxinfo') then
  vim.b.lua_context = "playdate"
elseif u.files.is_in_directory('~/.vim') then
  vim.b.lua_context = "vim"
elseif u.files.is_in_directory('~/.local/share/nvim') then
  vim.b.lua_context = "vim"
elseif filename == ".nvim.lua" then
  vim.b.lua_context = "vim"
else
  vim.b.lua_context = ''
end

if vim.b.lua_context == 'vim' then
  vim.keymap.set('n', '<leader>so', ':source %<return>', { buffer = true })
end
