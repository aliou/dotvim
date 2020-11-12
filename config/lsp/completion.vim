if has('nvim')
  " Explicitly trigger completion.
  let g:completion_enable_auto_popup = 0

  " TODO: completion only for filetypes with nvim's LSP.
  imap <silent> <c-p> <Plug>(completion_trigger)
end
