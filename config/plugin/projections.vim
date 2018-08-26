" Projectionist configuration.
if !exists('g:projectionist_heuristics')
  let g:projectionist_heuristics = {}
endif

let s:projection_descriptions = [
      \   { 'test': 'Formula/|cmd/', 'file': 'brew.json' },
      \   { 'test': 'libexec/&!.projections.json', 'file': 'sub.json' },
      \   { 'test': 'plugin/|colors/|ftdetect/', 'file': 'vim_plugin.json' },
      \   { 'test': 'Package.swift', 'file': 'swiftpm.json' },
      \   { 'test': '_config.yml', 'file': 'jekyll.json' }
      \ ]

" TODO: simplify path thingy.
for s:item in s:projection_descriptions
  let s:file = $HOME . "/.vim/share/projections/" . s:item.file
  let s:file_content = join(readfile(s:file), "\n")
  let g:projectionist_heuristics[s:item.test] = json_decode(s:file_content)
endfor
