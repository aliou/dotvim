" html 5 tags.
syn keyword htmlTagName contained article aside audio canvas command datalist
syn keyword htmlTagName contained details embed figcaption figure footer header
syn keyword htmlTagName contained hgroup keygen mark meter nav output progress
syn keyword htmlTagName contained rp rt ruby section source summary time video
" html 5 arguments.
syn keyword htmlArg contained autofocus placeholder min max step
syn keyword htmlArg contained contenteditable contextmenu draggable hidden item
syn keyword htmlArg contained itemprop list subject spellcheck
" this doesn't work because default syntax file alredy define a 'data' attribute
syn match   htmlArg "\<\(data-[\-a-zA-Z0-9_]\+\)=" contained
