if has('nvim')
  lua require('cstm.config.treesitter')

  augroup nvim.treesitter
    autocmd!

    " Fix issue with nvim-treesitter and Ruby where `%` and highlighting paris
    " don't correctly work.
    autocmd BufNewFile,BufRead *.rb set syntax=ruby
  augroup END
endif
