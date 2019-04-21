" Consider `$` as part of a word text object.
setlocal iskeyword+=$
let b:undo_ftplugin .= " | set iskeyword<"
