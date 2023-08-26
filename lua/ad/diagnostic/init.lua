require('ad.diagnostic.config')
require('ad.diagnostic.maps')
require('ad.diagnostic.theme')

-- Setup diagnostics default values.
-- Can be overriden in vimrc.local files by clearing the autocmd augroup.
local augroup = vim.api.nvim_create_augroup('ad.diagnostics', { clear = true })

local status = require('ad.diagnostic.status')

status.setup(augroup)
