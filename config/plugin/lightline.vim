let g:lightline = {}

let g:lightline.component_expand = {
      \   'ale_linter_indicator': 'status#ale#lightline#linter_indicator',
      \   'ale_fixer_indicator': 'status#ale#lightline#fixer_indicator',
      \ }

let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \   'working_directory': 'status#cwd'
      \ }

let g:lightline.component_type = {
      \   'ale_linter_indicator': 'tabsel',
      \   'ale_fixer_indicator': 'tabsel',
      \   'gitbranch': 'tabsel',
      \   'working_directory': 'tabsel',
      \ }

let g:lightline.active = {
      \   'left': [['bufname'], ['gitbranch'], ['readonly', 'relativepath', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['filetype'],
      \             ['ale_linter_indicator', 'ale_fixer_indicator']]
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
      \   'left': [['tabs']], 'right': [['working_directory']]
      \ }

augroup lightline_config
  autocmd!

  autocmd User ALELintPre  call status#ale#pre_lint()  | call lightline#update()
  autocmd User ALELintPost call status#ale#post_lint() | call lightline#update()

  autocmd User ALEFixPre   call status#ale#pre_fix()   | call lightline#update()
  autocmd User ALEFixPost  call status#ale#post_fix()  | call lightline#update()
augroup END
