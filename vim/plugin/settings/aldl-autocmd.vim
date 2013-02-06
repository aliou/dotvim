if has("autocmd")
  " Files ----------------------------------------------------------------- {{{
  " makefiles do not like spaces.
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab 

  " These are Ruby files.
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} 
        \ set ft=ruby

  " These are markdown files.
  autocmd BufRead,BufNewFile *.{md,markdown,mdown} set ft=markdown
  autocmd Filetype markdown setlocal spell

  autocmd filetype gitcommit setlocal textwidth=72

  autocmd filetype css inoremap { <space>{<CR>}<esc>O
  " }}}
  " Interface ------------------------------------------------------------- {{{
  " Restore cursor position.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Save on loss of focus when using a GUI.
  if has("gui")
    autocmd FocusLost * silent! wa
  endif

  " Resize splits when window is resized.
  autocmd VimResized * :wincmd =


  " Restore foldings.
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
  " }}}
  " Folds ----------------------------------------------------------------- {{{
  autocmd FileType c,cpp setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype less,css setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype vim setlocal foldmethod=marker
  autocmd FileType html setlocal foldmethod=manual
  autocmd FileType ruby setlocal foldmethod=syntax
  " }}}
endif
