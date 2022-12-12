-- local nvim_lsp = require('lspconfig')

local setup = function(on_attach, capabilities)
  -- nvim_lsp.sourcekit.setup({
  --   capabilities = capabilities,
  --   on_attach = on_attach,
  -- })

  require('xbase').setup({
      sourcekit = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
      mappings = {
        --- Whether xbase mapping should be disabled.
        enable = true,
        --- Open build picker. showing targets and configuration.
        build_picker = "<leader>xb", --- set to 0 to disable
        --- Open run picker. showing targets, devices and configuration
        run_picker = "<leader>xr", --- set to 0 to disable
        --- Open watch picker. showing run or build, targets, devices and configuration
        watch_picker = "<leader>xs", --- set to 0 to disable
        --- A list of all the previous pickers
        all_picker = "<leader>ef", --- set to 0 to disable
        --- horizontal toggle log buffer
        toggle_split_log_buffer = "<leader>xls",
        --- vertical toggle log buffer
        toggle_vsplit_log_buffer = "<leader>xlv",
      }
    })
end

return { setup = setup }
