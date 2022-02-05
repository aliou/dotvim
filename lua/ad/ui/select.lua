local native_select = vim.ui.select

local default_select = function(items, opts, on_choice)
  native_select(items, opts, on_choice)
end

local code_action_select = function(items, opts, on_choice)
  if #items == 1 then
    return on_choice(items[1])
  end

  default_select(items, opts, on_choice)
end

return function(items, opts, on_choice)
  if opts.kind == "codeaction" then
    return code_action_select(items, opts, on_choice)
  end

  return default_select(items, opts, on_choice)
end
