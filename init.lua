local api = vim.api

-- Setup runtimepath and packpath to include ~/.vim directory..
-- TODO: Use tjdevries's vim.opt when / if it is merged into core.
local runtimepath = api.nvim_get_option('runtimepath')

-- Set the vim directory as the first directory to search into and the after
-- directory as the last to search into.
runtimepath = '~/.vim,' .. runtimepath .. ',~/.vim/after'

-- Save the option and update the packpath value to match.
api.nvim_set_option('runtimepath', runtimepath)
api.nvim_set_option('packpath', runtimepath)

-- Setting up early so mappings with <leader> use the this value.
vim.g.mapleader = ','

-- Require files to bootstrap configuration.
require('vim.registers')

-- Require plugins.
require('cstm.packages')

-- Load split configuration files.
-- TODO: Rewrite some (all?) of those in lua.
vim.cmd [[ runtime! config/**/*.vim ]]
