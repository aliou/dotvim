" Projectionist configuration.
if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

let s:projection_descriptions = [
      \   {
      \     'test': 'Formula/|cmd/',
      \     'path': $HOME . '/.vim/share/projections/brew.json'
      \   },
      \   {
      \     'test': 'libexec/&!.projections.json',
      \     'path': $HOME . '/.vim/share/projections/sub.json'
      \   },
      \   {
      \     'test': 'plugin/|colors/|ftdetect/',
      \     'path': $HOME . '/.vim/share/projections/vim_plugin.json'
      \   },
      \   {
      \     'test': 'Package.swift',
      \     'path': $HOME . '/.vim/share/projections/swiftpm.json'
      \   },
      \   {
      \     'test': '_config.yml',
      \     'path': $HOME . '/.vim/share/projections/jekyll.json'
      \   }
      \ ]

" TODO: simplify path thingy.
for s:item in s:projection_descriptions
  let s:file_content = join(readfile(s:item.path), "\n")
  let g:projectionist_heuristics[s:item.test] = json_decode(s:file_content)
endfor
