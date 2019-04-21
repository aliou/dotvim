let s:rndm_m1 = 32007779 + (localtime() % 100 - 50)
let s:rndm_m2 = 23717810 + (localtime() / 86400) % 100
let s:rndm_m3 = 52636370 + (localtime() / 3600) % 100

" https://github.com/posva/Rndm
function! utils#random#number() abort
  let m4= s:rndm_m1 + s:rndm_m2 + s:rndm_m3
  if(s:rndm_m2 < 50000000)
    let m4 = m4 + 1357
  endif
  if (m4 >= 100000000)
    let m4 = m4 - 100000000
    if (m4 >= 100000000)
      let m4 = m4 - 100000000
    endif
  endif

  let s:rndm_m1 = s:rndm_m2
  let s:rndm_m2 = s:rndm_m3
  let s:rndm_m3 = m4

  return s:rndm_m3
endfunction
