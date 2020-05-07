setlocal statusline=%!status#fuzzy()
let b:undo_ftplugin = "setlocal statusline<"

if !has('nvim')
  setlocal termwinkey=<c-h>
  let b:undo_ftplugin .= ' termwinkey<'
endif
