let g:lightline = {}

let g:lightline.colorscheme = 'one'

let g:lightline.component_expand = {
      \   'lsp_diagnostic_indicator': 'status#lsp#diagnostic',
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \ }

let g:lightline.component_type = {
      \   'lsp_diagnostic_indicator': 'tabsel',
      \   'gitbranch': 'tabsel',
      \ }

let g:lightline.active = {
      \   'left': [['bufname'], ['gitbranch'], ['readonly', 'relativepath', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['filetype'], ['lsp_diagnostic_indicator']]
      \ }

let g:lightline.inactive = {
      \   'left': [['bufname'], ['gitbranch'], ['readonly', 'relativepath', 'modified']],
      \   'right': []
      \ }

let g:lightline.tab = {
      \   'active': ['filename', 'modified'],
      \   'inactive': ['tabnum', 'filename', 'modified']
      \ }

let g:lightline.tabline = {
      \   'left': [['tabs']], 'right': []
      \ }
