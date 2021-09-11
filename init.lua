-- Setup runtimepath and packpath to include ~/.vim directory.
-- Set the vim directory as the first directory to search into and the after
-- directory as the last to search into.
vim.opt.runtimepath = vim.opt.runtimepath:prepend({'~/.vim'}):append({'~/.vim/after'})
vim.opt.packpath = vim.opt.packpath:prepend({'~/.vim'}):append({'~/.vim/after'})

-- Setting up early so mappings with <leader> use the this value.
vim.g.mapleader = ','

-- Require files to bootstrap configuration.
require('vim.registers')

-- Require plugins.
require('ad.packages')

-- Load split configuration files.
-- TODO: Rewrite some (all?) of those in lua.
vim.cmd [[ runtime! config/**/*.vim ]]
require('cstm.config.treesitter')
require('cstm.config.completion')

-- Load custom thingies.
require('ad')
