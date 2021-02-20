local actions = {}
actions['ctrl-t'] = 'tab split'
actions['ctrl-x'] = 'split'
actions['ctrl-v'] = 'vsplit'

return {
  actions = actions,
  run = vim.fn['fzf#run'],
  wrap = vim.fn['fzf#wrap'],
}
