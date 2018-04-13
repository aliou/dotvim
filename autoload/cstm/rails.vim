function! cstm#rails#setup() abort
  " The function might also be called from non-ruby files (ex. Webpacker,
  " Sprockets, etc.), so we restrict the mapping definition.
  if &filetype ==# 'ruby' && get(g:, 'cstm_rails_hijack_keywordprg', 0)
    nnoremap <silent> <buffer> K :call cstm#rails#open_documentation()<CR>
  endif
endfunction

function! cstm#rails#open_documentation() abort
  let l:keyword = expand('<cword>')
  call job_start(['open', 'http://api.rubyonrails.org/?q=' . l:keyword])
endfunction
