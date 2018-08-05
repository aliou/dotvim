" Load the version of matchit bundled with vim. Improves `%`
if has('packages')
  silent! packadd matchit.vim
else
  silent! runtime macros/matchit.vim
end

if has('eval')
  " Disable some of the core plugins

  " Sup modern package managers.
  let g:loaded_getscriptPlugin = 'skipped'
  let g:loaded_vimballPlugin = 'skipped'

  " I use Ack.vim for this.
  let g:loaded_logiPat = 'skipped'

  " Don't need vim server.
  let g:loaded_rrhelper = 'skipped'

  " I have custom dictionaries anyway.
  let g:loaded_spellfile_plugin = 'skipped'

  " Let's not read archives from vim.
  let g:loaded_gzip = 'skipped'
  let g:loaded_tarPlugin = 'skipped'
  let g:loaded_zipPlugin = 'skipped'

  let g:loaded_matchparen = 'skipped'
endif
