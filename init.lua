-- Setup runtimepath and packpath to include ~/.vim directory.
-- Set the vim directory as the first directory to search into and the after
-- directory as the last to search into.
vim.opt.runtimepath:prepend({'~/.vim'})
vim.opt.runtimepath:append({'~/.vim/after'})

vim.opt.packpath:prepend({'~/.vim'})
vim.opt.packpath:append({'~/.vim/after'})

-- Setting up early so mappings with <leader> use the this value.
vim.g.mapleader = ','

-- Require plugins.
require('ad.packages')

-- Load split configuration files.
-- TODO: Rewrite some (all?) of those in lua.
vim.cmd [[ runtime! config/**/*.vim ]]
require('cstm.config.treesitter')
require('cstm.config.completion')

-- Load custom thingies.
require('ad')

-- Require local thingies last.
require('ad.local')
