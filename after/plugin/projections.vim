" Projectionist configuration.
if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

let s:brew_projections = $HOME . '/.vim/share/projections/brew.json'

if filereadable(s:brew_projections)
  let s:file_content = join(readfile(s:brew_projections), "\n")
  let g:projectionist_heuristics['Formula/'] = json_decode(s:file_content)
endif
