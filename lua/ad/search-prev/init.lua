local live_grep = require('telescope.builtin').live_grep
local actions = require('telescope.actions')

local exec = function(term)
  term = term or vim.fn.expand("<cword>")
  -- TODO(ad): Remove things that are not word.

  local options = {
    default_text = term,
    attach_mappings = function(prompt_number, _)
      actions.select_default:replace(function()
        vim.fn.setqflist({})
        actions.add_to_qflist(prompt_number)
        vim.cmd [[ copen ]]
        vim.cmd [[ cc! 1 ]]
      end)
      return true
    end,
  }

  live_grep(options)
end

local command_exec = function(options)
  exec(options.args)
end

-- False positive.
---@diagnostic disable-next-line: duplicate-set-field
-- _G.ad_search_operator = function(mode)
--   local term = nil
--   if mode == "v" then
--     term = vim.fn['utils#current_selection']()
--   end

--   exec(term)
-- end

-- vim.keymap.set('n', '<leader>s', exec, { silent = true })
-- vim.api.nvim_create_user_command('Search', command_exec, { nargs = "*", range = 0 })

-- vim.cmd [[
--   nnoremap <silent> s :set operatorfunc=v:lua.ad_search_operator<CR>g@
--   vnoremap <silent> s :<C-U>call v:lua.ad_search_operator(visualmode())<CR>
-- ]]
