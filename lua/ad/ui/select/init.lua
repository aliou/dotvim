local native_select = vim.ui.select

-- NOTE: It shouldn't really be possible to have the codeaction
-- be automatically executed as we have a custom handler below,
-- but for the sake of completeness, we still add it to the deny list.
-- In the future, we might make sure that custom handlers are automatically
-- added to the deny list.
local kind_auto_execute_deny_list = { ["codeaction"] = true }

local code_action_select = function(items, opts, on_choice)
  P({ items = items, opts = opts })
  return native_select(items, opts, on_choice)
end

-- TODO:
-- * Format items to add a title
-- * Pass the title to the native_select function
-- * in the on_choice, deduce the selected value from the formatted items.
local references_select = function(items, opts, on_choice)
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
  ["lsp/handlers/references"] = references_select,
}

return function(items, opts, on_choice)
  local custom_handler = custom_select_handlers[opts.kind]
  if custom_handler then
    return custom_handler(items, opts, on_choice)
  end

  fallback_select(items, opts, on_choice)
end
