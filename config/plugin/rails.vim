let s:rails_projection_file = $HOME . '/.vim/share/projections/rails.json'

if filereadable(s:rails_projection_file)
  let s:file_content = join(readfile(s:rails_projection_file), "\n")
  let g:rails_projections = json_decode(s:file_content)
endif
