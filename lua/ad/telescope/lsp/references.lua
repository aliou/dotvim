local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local make_entry = require('telescope.make_entry')

local if_nil = vim.F.if_nil

local references = function(opts)
  opts = opts or {}

  local params = vim.lsp.util.make_position_params()
  local includeDeclaration = if_nil(opts.includeDeclaration, false)
  params.context = { includeDeclaration = includeDeclaration }

  local timeout = if_nil(opts.timeout, 5000)
  local response, err = vim.lsp.buf_request_sync(0, "textDocument/references", params, timeout)
  if err then
    vim.api.nvim_err_writeln("Error when finding references: " .. err)
    return
  end

  -- ewwwww
  if #response == 1 then
    if response[1].result then
      if vim.tbl_islist(response[1].result) then
        vim.lsp.util.jump_to_location(response[1].result[1])
      else
        vim.lsp.util.jump_to_location(response[1].result)
      end
    return
    end
  end

  local locations = {}
  for _, server_results in pairs(response) do
    if server_results.result then
      vim.list_extend(locations, vim.lsp.util.locations_to_items(server_results.result) or {})
    end
  end

  if vim.tbl_isempty(locations) then
    return
  end

  pickers.new(opts, {
    prompt_title = "LSP References",
    finder = finders.new_table {
      results = locations,
      entry_maker = opts.entry_maker or make_entry.gen_from_quickfix(opts),
    },
    previewer = conf.qflist_previewer(opts),
    sorter = conf.generic_sorter(opts),
  }):find()
end

return references
