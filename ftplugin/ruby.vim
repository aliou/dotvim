if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

command! -buffer -nargs=1 Doc call cstm#ruby#documentation(<q-args>)
