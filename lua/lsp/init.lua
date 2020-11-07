-- nvim_lsp object
local nvim_lsp = require('nvim_lsp')

-- function to attach completion and diagnostics
-- when setting up lsp
local on_attach = function(client)
    require('completion').on_attach(client)
    require('diagnostic').on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
