local native_select = vim.ui.select

local ui_select = function(items, opts, on_choice)
  P({ items = items, opts = opts })
  native_select(items, opts, on_choice)
end

return ui_select
