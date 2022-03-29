local runtime_paths = vim.split(package.path, ';')

table.insert(runtime_paths, 'lua/?.lua')
table.insert(runtime_paths, 'lua/?/init.lua')
table.insert(runtime_paths, './?/init.lua')
table.insert(runtime_paths, vim.fn.getenv('VIMRUNTIME') .. '/lua')
table.insert(runtime_paths, vim.fn.expand('~/.vim/lua/?.lua'))

-- TODO: Also include path to packages added by packer.nvim using runtime files.
-- local runtime_files = vim.api.nvim_get_runtime_file('', true)

vim.g.lua_path = runtime_paths

-- TODO: Limit this to files in `$VIMRUNTIME` and `~/.vim`.
-- The best way to do this would probably be to have the map call a
-- function that checks if the current file matches one of the pattern
-- in the runtime_paths variable.
vim.keymap.set('n',  '<leader>so', ':source %<return>', { buffer = true })
