if has("autocmd")

  " makefiles do not like spaces.
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab 

  " These are Ruby files.
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} 
        \ set ft=ruby

  " These are markdown files.
  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell

  autocmd filetype gitcommit setlocal textwidth=72

  " Restore cursor position.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Save on loss of focus when using a GUI.
  if has("gui")
    autocmd FocusLost * silent! wa
  endif

  autocmd filetype css inoremap { <space>{<CR>}<esc>O

  " Restore foldings.
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview

endif
