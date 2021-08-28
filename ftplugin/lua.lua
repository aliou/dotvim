-- This is used by apathy to setup the include path.
local runtime_paths = vim.split(package.path, ';')
table.insert(runtime_paths, 'lua/?.lua')
table.insert(runtime_paths, 'lua/?/init.lua')
table.insert(vim.g.lua_path, vim.fn.expand('~/.vim/lua/?.lua'))
table.insert(vim.g.lua_path, vim.fn.getenv('VIMRUNTIME') .. '/lua')

-- TODO: Also include path to packages added by packer.nvim using runtime files.
-- local runtime_files = vim.api.nvim_get_runtime_file('', true)

vim.g.lua_path = runtime_paths

-- TODO: Limit this to files in `$VIMRUNTIME` and `~/.vim`.
vim.cmd [[
  nnoremap <buffer> <leader>so :source %<Return>
]]
