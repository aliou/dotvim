local api = vim.api

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

-- Source the "regular" / "legacy" configuration file.
vim.cmd [[ source ~/.vim/vimrc ]]

-- TODO: Start requiring lua files from here instead of from vimscript files.
-- Basically, only have options compatible with vim in vimscript files and nvim
-- configuration in lua files.
