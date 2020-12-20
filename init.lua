local api = vim.api

-- TODO: Use tjdevries's vim.opt when / if it is merged into core.
local runtimepath = api.nvim_get_option('runtimepath')

-- Set the vim directory as the first directory to search into.
runtimepath = '~/.vim,' .. runtimepath

-- Add the after directory in the directory to search into.
runtimepath = runtimepath .. ',~/.vim/after'

-- Save the option.
api.nvim_set_option('runtimepath', runtimepath)

-- Update the directories to find packages to include our updates.
api.nvim_set_option('packpath', runtimepath)

-- Setting up early so mappings with <leader> use the this value.
vim.g.mapleader = ','

-- Require plugins.
require('cstm.plugins')

-- Load split configuration files.
-- TODO: Rewrite some (all?) of those in lua.
vim.cmd [[ runtime! config/**/*.vim ]]
