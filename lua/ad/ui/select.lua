local native_select = vim.ui.select

local kind_auto_execute_deny_list = { ["codeaction"] = true }

local code_action_select = function(items, opts, on_choice)
  return native_select(items, opts, on_choice)
end

local fallback_select = function (items, opts, on_choice)
  if #items == 1 and not kind_auto_execute_deny_list[opts.kind] then
    return on_choice(items[1])
  end

  return native_select(items, opts, on_choice)
end

local custom_select_handlers = {
  ["codeaction"] = code_action_select,
}

return function(items, opts, on_choice)
  local custom_handler = custom_select_handlers[opts.kind]
  if custom_handler then
    return custom_handler(items, opts, on_choice)
  end

  fallback_select(items, opts, on_choice)
end
