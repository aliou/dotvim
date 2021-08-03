local lsp = require('vim.lsp')

local apply_action = function(action)
  -- textDocument/codeAction can return either Command[] or CodeAction[].
  -- If it is a CodeAction, it can have either an edit, a command or both.
  -- Edits should be executed first
  if action.edit or type(action.command) == "table" then
    if action.edit then
      lsp.util.apply_workspace_edit(action.edit)
    end
    if type(action.command) == "table" then
      lsp.buf.execute_command(action.command)
    end
  else
    lsp.buf.execute_command(action)
  end
end

local handler = function(_, _, actions)
  if actions == nil or vim.tbl_isempty(actions) then
    return
  end

  -- Don't bother building the action list if there's only one; directly apply
  -- the action.
  if #actions == 1 then
    apply_action(actions[1])
    return
  end

  local option_strings = {"Code Actions:"}
  for i, action in ipairs(actions) do
    local title = action.title:gsub('\r\n', '\\r\\n')
    title = title:gsub('\n', '\\n')
    table.insert(option_strings, string.format("%d. %s", i, title))
  end

  local choice = vim.fn.inputlist(option_strings)
  if choice < 1 or choice > #actions then
    return
  end

  local action_chosen = actions[choice]
  apply_action(action_chosen)
end

vim.lsp.handlers['textDocument/codeAction'] = handler
