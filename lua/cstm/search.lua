local u = require('cstm.util')

-- TODO: There's a functional library for Lua that exists, might be interesting
-- to have it in dotfiles to avoid having to re-implement those when needed.
local filter_args = function(argv)
  local filtered_args = {}

  for _, v in ipairs(argv) do
    if v ~= "" then table.insert(filtered_args, v) end
  end

  return filtered_args
end

local complete_directories = function(lead)
  -- TODO: Filter out hidden directories by default?
  local filter_directories = function(entry)
    local is_directory = vim.fn.isdirectory(entry) == 1
    local starts_with_lead = lead == "" or vim.startswith(entry, lead)

    return is_directory and starts_with_lead
  end

  return vim.fn.readdir('.', filter_directories)
end

local complete_term = function(lead)
  local lines = vim.fn.join(vim.fn.getline(1, '$'))
  -- Using vim.fn.split instead of vim.split because we can use actual regular
  -- expressions instead of Lua's patterns.
  local uniq_words = u.fn.compact(u.fn.uniq(vim.fn.split(lines, [[[[:blank:],.;:!?%#*+^@&/~|=<>\[\](){}]\+]])))
  local words = u.fn.sort(uniq_words)

  -- if true then return {} end

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
  local argv = filter_args(vim.split(cmd_line, ' '))
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
