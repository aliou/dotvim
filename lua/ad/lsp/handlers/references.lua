local util = require('vim.lsp.util')

-- local previous_handler = vim.lsp.handlers['textDocument/references']
local references = function(_err, result, ctx, _config)
  if not result or vim.tbl_isempty(result) then
    vim.notify('No references found')
    return
  end

  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local items = util.locations_to_items(result, client.offset_encoding)

  P(items)

  local on_choice = function(_, index)
    if index == nil then return end

    local location = result[index]
    util.jump_to_location(location, client.offset_encoding)
  end

  local format_item = function(item)
    local text = string.gsub(item.text, '^%s*(.-)%s*$', '%1')
    local filename = string.gsub(item.filename, client.config.root_dir, '')
    P(client.config.root_dir)
    P(item.filename)
    return string.format("%s|%d col %d|%s", filename, item.lnum, item.col, text)
  end

  P(client.workspace_folders)
  P(client.config)

  local opts = {
    format_item = format_item,
    kind = 'lsp/handlers/references'
  }
  vim.ui.select(items, opts, on_choice)
end

-- vim.lsp.handlers['textDocument/references'] = references
