local u = require('cstm.util')

local  curried_filter_directories = function(lead)
  return function(entry)
    local is_directory = vim.fn.isdirectory(entry) == 1
    local starts_with_lead = lead == "" or vim.startswith(entry, lead)

    return is_directory and starts_with_lead
  end
end

-- TODO: Filter out hidden directories by default?
local complete_directories = function(lead)
  local root = './'

  if lead ~= "" and vim.fn.isdirectory(lead) == 1 then
    root = lead
  end

  print(vim.inspect(root))
  local directories = vim.fn.readdir(root, curried_filter_directories(lead))

  local result = u.fn.map(directories, function(entry)
    return root .. entry
  end)
  print(vim.inspect(result))

  return result
end

-- TODO: Add tags from current project using `taglist()`.
local complete_term = function(lead)
  local lines = vim.fn.join(vim.fn.getline(1, '$'))
  -- Using vim.fn.split instead of vim.split because we can use actual regular
  -- expressions instead of Lua's patterns.
  local uniq_words = u.fn.compact(u.fn.uniq(vim.fn.split(lines, [[[[:blank:],.;:!?%#*+^@&/~|=<>\[\](){}]\+]])))
  local words = u.fn.sort(uniq_words)

  -- If there's no lead, don't bother filtering the words.
  if lead == "" then return words end

  local matching_words = {}
  for _, word in ipairs(words) do
    -- TODO: Fuzzy?
    if vim.startswith(word, lead) then
      table.insert(matching_words, word)
    end
  end

  return matching_words
end

local complete = function(arg_lead, cmd_line, cursor_pos)
  local argv = u.fn.compact(vim.split(cmd_line, ' '))
  print(vim.inspect({ arg_lead = arg_lead, cursor_pos = cursor_pos, argv = argv, argc = #argv }))

  -- If we only have one argument (the command) and our position is after it,
  -- we're completing the search term.
  if #argv == 1 then return complete_term(arg_lead) end
  if #argv == 2 and arg_lead ~= "" then return complete_term(arg_lead) end
  if #argv == 2 and arg_lead == "" then return complete_directories(arg_lead) end
  if #argv == 3 and arg_lead ~= "" then return complete_directories(arg_lead) end

  return {}
end

return {
  complete = complete,
}
