if has("autocmd")

  " Yeah, whatever.
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab 
  autocmd FileType php setlocal expandtab tabstop=2 shiftwidth=2 autoindent     
        \ smartindent

  " These are Ruby files.
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} 
        \ set ft=ruby

  " These are markdown files.
  autocmd BufRead,BufNewFile {md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown set spell

  " Restore cursor position
  if &filetype != "gitcommit"
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  endif

  " Save on loss of focus when using a GUI.
  if has("gui")
    autocmd FocusLost * silent! wa
  endif

endif
