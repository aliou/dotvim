local pick = require('mini.pick')

local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

local custom_picker = function()
  local matches = MiniPick.get_picker_matches()
  if matches == nil then
    return false
  end

  -- local current = matches.current
  -- local all = vim.tbl_extend('keep', { current }, matches.all)

  pick.default_choose_marked(matches.all)
end

pick.setup({
  -- mappings = {
  --   cstm = {
  --     char = '<cr>',
  --     func = custom_picker,
  --   }
  -- },
  options = {
    use_cache = false,
  },
  window = {
    config = win_config,
  }
})

local exec = function(term)
  term = term or vim.fn.expand("<cword>")

  MiniPick.builtin.grep({ pattern = term }, {})
end

local command_exec = function(options)
  exec(options.args)
end

-- False positive.
---@diagnostic disable-next-line: duplicate-set-field
_G.ad_search_operator = function(mode)
  local term = nil
  if mode == "v" then
    term = vim.fn['utils#current_selection']()
  end

  exec(term)
end

vim.keymap.set('n', '<leader>s', exec, { silent = true })
vim.api.nvim_create_user_command('Search', command_exec, { nargs = "*", range = 0 })

vim.cmd [[
  nnoremap <silent> s :set operatorfunc=v:lua.ad_search_operator<CR>g@
  vnoremap <silent> s :<C-U>call v:lua.ad_search_operator(visualmode())<CR>
]]
