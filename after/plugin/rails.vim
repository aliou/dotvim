let s:rails_projection_file = $HOME . "/.vim/share/projections/rails.json"

if filereadable(s:rails_projection_file)
  let file_content = join(readfile(s:rails_projection_file), "\n")
  let g:rails_projections = json_decode(file_content)
endif
