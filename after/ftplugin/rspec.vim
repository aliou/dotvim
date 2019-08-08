" Make sure the undo command exists.
if !exists('b:undo_ftplugin') | let b:undo_ftplugin = '' | endif

if exists("loaded_matchit")
  " let s:ruby_match_words =
	" \ '\<\%(if\|unless\|case\|while\|until\|for\|do\|class\|module\|def\|begin\)\>=\@!' .
	" \ ':' .
	" \ '\<\%(else\|elsif\|ensure\|when\|rescue\|break\|redo\|next\|retry\)\>' .
	" \ ':' .
	" \ '\%(^\|[^.\:@$]\)\@<=\<end\:\@!\>' .
	" \ ',{:},\[:\],(:)'

  let s:spec_match_words =
	\ '\<\%(describe\|context\|it\)\>=\@!' .
	\ ':' .
	\ '\<\%(do\)\>' .
	\ ':' .
	\ '\%(^\|[^.\:@$]\)\@<=\<end\:\@!\>' .
	\ ',{:},\[:\],(:)'

  " TODO: Try to append to the existing match words but remove the `do` in
  " starting matches, to prevent overriding the `it` -> `do` -> `end` flow.
  let b:match_words = s:spec_match_words
endif
