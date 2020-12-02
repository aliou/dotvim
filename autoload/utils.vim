function! utils#random() abort
  return utils#random#number()
endfunction

" Stolen from <https://git.io/Jvrb0>
function! utils#current_selection()
  let l:saved_cursor = getpos('.')

  let l:original_reg      = getreg('z')
  let l:original_reg_type = getregtype('z')

  normal! gv"zy
  let l:text = @z

  call setreg('z', l:original_reg, l:original_reg_type)
  call setpos('.', l:saved_cursor)

  return l:text
endfunction

function! utils#is_vim() abort
  return exists('*job_start')
endfunction


function! utils#is_neovim() abort
  return has('nvim') && exists('*jobwait')
endfunction

function! utils#var(variable_name, options) abort
  let l:default = get(a:options, 'default', v:null)
  let l:namespace = get(a:options, 'namespace', '')
  let l:full_name = l:namespace . a:variable_name

  return get(b:, l:full_name, get(g:, l:full_name, default))
endfunction
