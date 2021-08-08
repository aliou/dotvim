local Menu = require('nui.menu')
local lsp = require('vim.lsp')

local menu_options = {
  border = {
    style = "rounded",
  },
  -- highlight for the window.
  highlight = "Normal:Comment",
  relative = "cursor",
  -- position the popup window on the line below identifier
  position = {
    row = 1,
    col = 0,
  },
  size = {
    width = 50,
  },
}

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
  -- NOTE: This might be dangerous, but we can easily undo this change.
  if #actions == 1 then
    apply_action(actions[1])
    return
  end

  local lines = {}
  for i, action in ipairs(actions) do
    local title = string.format("%s. %s", i, action.title)
    table.insert(lines, Menu.item(title, action))
  end

  local menu = Menu(menu_options, {
    lines = lines,
    separator = {
      char = "-",
      text_align = "right",
    },
    on_submit = apply_action,
  })

  menu:mount()
end

vim.lsp.handlers['textDocument/codeAction'] = handler
