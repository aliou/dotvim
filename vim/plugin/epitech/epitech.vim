" inoremap <c-v><c-i> <m-i>
inoremap <TAB> <c-i>
let ext = expand("%:e")
" 
if (ext == "h" || ext == "c" || ext == "hpp" || ext == "cpp")
"   set cindent
"   set softtabstop=2
"   set shiftwidth=2
"   set expandtab
  set comments=s1:/*,mb:**,ex:*/
endif
