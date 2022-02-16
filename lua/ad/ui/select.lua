local native_select = vim.ui.select

return function(items, opts, on_choice)
  if #items == 1 then
    return on_choice(items[1])
  end

  return native_select(items, opts, on_choice)
end
