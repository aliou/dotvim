" Projectionist configuration.
if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

let s:brew_projections = [
      \   {
      \     'key': 'Formula/|cmd/',
      \     'path': $HOME . '/.vim/share/projections/brew.json'
      \   }
      \ ]

for s:item in s:brew_projections
  let s:file_content = join(readfile(s:item.path), "\n")
  let g:projectionist_heuristics[s:item.key] = json_decode(s:file_content)
endfor
