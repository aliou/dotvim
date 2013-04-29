" Found somewhere online, I don't even know what half of this does.
function! RemoveSpace()
  let pos = line(".")
  let ext = expand("%:e")
  if (ext == "h" || ext == "c")
    execute "9,$s/[ \t]*$//"
  else
    execute "0,$s/[ \t]*$//"
  endif
  execute pos
endfunction

function! DeleteSpaces()
  silent execute "1,9s/^ //"
endfunction

let s:login		= "diallo_e"
let s:name		= "aliou diallo"

let s:txt_made_by	= "Made by "
let s:txt_login		= "Login   "
let s:txt_mail_s	= "<"
let s:txt_mail_e	= "@epitech.net>"
let s:txt_start		= "Started on  "
let s:txt_last		= "Last update "
let s:txt_for		= " for "
let s:txt_in		= " in "

let s:date_format	= "%a %b %d %H:%M:%S %Y"

function s:GetComStr()
  let hascom = 1
  if &ft == "c" || expand("%:e") == "h"
    let s:cs = "/\*"
    let s:cc = "\*\* "
    let s:ce = "\*/"
  elseif &ft == "cpp" || &ft == "hh" || &ft == "hpp"
    let s:cs = "//"
    let s:cc = "// "
    let s:ce = "//"
  elseif &ft == "java"
    let s:cs = "/\*"
    let s:cc = "\*\* "
    let s:ce = "\*/"
  elseif &ft == "make"
    let s:cs = "##"
    let s:cc = "## "
    let s:ce = "##"
  else
    let hascom = 0
  endif
  return hascom
endfunction

function s:LineFind(pat)
  let i = 1
  let l = getline(i)
  while l !~ '^\s*$' && i < 10
    if match(l, a:pat) != -1
      return i
    endif
    let i = i + 1
    let l = getline(i)
  endwhile
  return 0
endfunction

function s:LineUpdate(lnum, newline)
  let oldline = getline(a:lnum)
  if oldline != a:newline
    call setline(a:lnum, a:newline)
  endif
endfunction

function HeaderUpdate()
  if s:GetComStr()
    let lnum = s:LineFind(s:cc . s:txt_last)
    if lnum
      let newline = s:cc . s:txt_last . strftime(s:date_format) .' '. s:name
      call s:LineUpdate(lnum, newline)
    endif
    let lnum = s:LineFind('^\('. s:cc .'\).*\('. s:txt_for. '\).*\('. s:txt_in .'\).*$')
    if lnum
      let newline = s:cc . expand("%:t") . s:txt_for . expand("%:p:h:t") . s:txt_in . expand("%:p:h")
      call s:LineUpdate(lnum, newline)
    endif
  endif
endfunction

function HeaderCreate(new)
  if s:GetComStr()
    setl fo-=o fo-=r fo-=a fo-=c
    setl noautoindent nosmartindent nocindent
    execute "normal! ggO" .
      \ s:cs . "\n".
      \ s:cc . expand("%:t") . s:txt_for . expand("%:p:h:t") . s:txt_in . expand("%:p:h") . "\n".
      \ s:cc . "\n".
      \ s:cc . s:txt_made_by . s:name . "\n".
      \ s:cc . s:txt_login . s:txt_mail_s . s:login . s:txt_mail_e . "\n".
      \ s:cc . "\n".
      \ s:cc . s:txt_start . strftime(s:date_format) .' '. s:name . "\n".
      \ s:cc . s:txt_last . strftime(s:date_format) .' '. s:name . "\n".
      \ s:ce
    if getline(10) !~ '^\s*$'
      execute "normal! 10"
      execute "normal! o"
    endif
    setl fo+=o fo+=r fo+=a fo+=c
    setl autoindent smartindent cindent
    if (expand("%:e") == "h" || expand("%:e") == "hh" || expand("%:e") == "hpp") && a:new
      call ProtectHeaders()
      call InsertPrototypes()
    else
      execute "normal! G"
    endif
  endif
endfunction

function HeaderF10()
  if s:GetComStr()
    if getline(1) == s:cs && getline(9) == s:ce
      execute "normal! gg9dd"
    endif
    call HeaderCreate(0)
  endif
endfunction

function ProtectHeaders()
  let filename = substitute(toupper(expand("%:t")), "\\.", "_", "g") . "_"
    execute "normal! Go" .
      \ '#ifndef '. filename . "\n".
      \ '# define ' . filename . "\n".
      \ "\n\n\n".
      \ '#endif /* !' . filename . ' */'
  normal! kk
endfunction

function InsertPrototypes()
  if (expand("%:e") != "h")
    return
  endif
  let cfile = expand("%:p:r") . ".c"
  if !filereadable(cfile)
    let cfile = expand("%:p:h") . input("Saisir un fichier: ", ".c")
    if !filereadable(cfile)
      return
    endif
    return
  endif
  let l = line(".")
  execute 'normal! o<EOIF>'
  silent execute (l) ." read ". cfile
  let lastline = getline(l)
  while lastline != '<EOIF>'
    let newline = getline(l + 1)
    if newline !~ '^{$' || !match(lastline, '.*\<main\>.*') || !match(lastline, '.*\<static\>.*')
      execute l
      execute l . "d"
    else
      call setline(l, lastline . ';')
      let l = l + 1
    endif
    let lastline = newline
  endwhile
  execute "normal! dd"
  if getline(l) !~ '^\s*$'
    execute "normal! O"
  endif
endfunction

if exists('g:epitech_header')
  autocmd BufWritePre *.c,*.h,Makefile,*.cpp,*.hh,*.hpp call RemoveSpace()
  autocmd BufNewFile *.c,*.h,Makefile,*.cpp,*.hh,*.hpp call HeaderCreate(1)
  autocmd BufWritePre,FileWritePre *.c,*.h,Makefile,*.cpp,*.hh,*.hpp call HeaderUpdate()
else
  autocmd BufNewFile *.h,*.hh,*.hpp call ProtectHeaders()
endif
