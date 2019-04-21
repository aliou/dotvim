" Targets can include `-`. This allows me to `*` on a target to see where it is
" called / defined in the file.
set iskeyword+=-
let b:undo_ftplugin .= " | set iskeyword<"
