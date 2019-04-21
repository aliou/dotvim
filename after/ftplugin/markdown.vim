" Use HTML comment stuff instead of `>`.
set commentstring=<!--%s-->
set comments=s:<!--,m:\ \ \ \ ,e:-->
let b:undo_ftplugin .= " | set commentstring< comments<"

" Disable text width for prose.
set textwidth=0
