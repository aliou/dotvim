local buf = require('vim.lsp.buf')
local util = require('vim.lsp.util')

local popup_open = vim.fn['popup_menu#open']

local code_action_handler = function(_, _, actions)
  if actions == nil or vim.tbl_isempty(actions) then
    print("No code actions available")
    return
  end

  local options = {}
  for i, action in ipairs(actions) do
    local title = action.title:gsub('\r\n', '\\r\\n')
    title = title:gsub('\n', '\\n')
    table.insert(options, string.format("%d. %s", i, title))
  end

  local print_selected = function(selected)
    local index = 0

    -- The popup menu extensions seems to return an empty string when there is a
    -- single selection possible.
    index = selected == "" and 0 or tonumber(vim.split(selected, ".", true)[1])

    local action = actions[index]
    -- textDocument/codeAction can return either Command[] or CodeAction[].
    -- If it is a CodeAction, it can have either an edit, a command or both.
    -- Edits should be executed first
    if action.edit or type(action.command) == "table" then
      if action.edit then
        util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        buf.execute_command(action.command)
      end
    else
      buf.execute_command(action)
    end

  end

  popup_open(options, print_selected)
end

vim.lsp.handlers['textDocument/codeAction'] = code_action_handler
