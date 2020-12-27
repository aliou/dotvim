local nvim_lsp = require('lspconfig')

local jq = require('cstm.lsp.server.efm.jq')
local rubocop = require('cstm.lsp.server.efm.rubocop')
local shellcheck = require('cstm.lsp.server.efm.shellcheck')
local vint = require('cstm.lsp.server.efm.vint')

local cmd = { "efm-langserver" }
if vim.g.lsp_efm_log_events then
  cmd = vim.tbl_extend("keep", { "-logfile", "/Users/alioudiallo/.local/share/nvim/efm.log", "-loglevel", "3" })
end

local setup = function(on_attach)
  nvim_lsp.efm.setup({
    on_attach = on_attach,
    cmd = cmd,
    filetypes = { 'ruby', 'json', 'bash', 'sh' },
    init_options = { documentFormatting = true },
    root_dir = nvim_lsp.util.find_git_ancestor,
    settings = {
      languages = {
        bash = { shellcheck },
        sh = { shellcheck },

        json = { jq },
        ruby = { rubocop },
        vim = { vint },
      }
    }
  })
end

return {
  setup = setup
}
