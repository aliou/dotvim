" This is used by apathy to setup the include path.
" TODO: Also include path to packages added by packer.nvim.
let g:lua_path = split(system('lua -e "print(package.path)"')[0:-2], ';')
call extend(g:lua_path, [$VIMRUNTIME . '/lua', expand('~/.vim/lua/?.lua')])
