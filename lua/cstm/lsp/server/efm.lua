local nvim_lsp = require('lspconfig')

local rubocop = require('cstm.lsp.server.efm.rubocop')
local shellcheck = require('cstm.lsp.server.efm.shellcheck')
local vint = require('cstm.lsp.server.efm.vint')

local setup = function(on_attach)
  nvim_lsp.efm.setup({
    on_attach = on_attach,
    cmd = { "efm-langserver", "-logfile", "/Users/alioudiallo/.local/share/nvim/efm.log", "-loglevel", "3" },
    filetypes = { 'ruby' },
    init_options = { documentFormatting = true },
    root_dir = nvim_lsp.util.find_git_ancestor,
    on_new_config = function(new_config, new_root_dir)
      print(vim.inspect(new_config))
      print(vim.inspect(new_root_dir))
    end,
    settings = {
      languages = {
        bash = { shellcheck },
        sh = { shellcheck },

        ruby = { rubocop },
        vim = { vint },
      }
    }
  })
end

return {
  setup = setup
}
