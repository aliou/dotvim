" Name:         festoon.vim
" Maintainer:   Carson Fire <carsonfire@gmail.com>
" Last Change:  2011-12-20
" Version:      1.0

hi clear
if exists("syntax_on")
   syntax reset
endif
let g:colors_name="festoon"

if &background == "light"
   hi Normal gui=none guifg=#444444 guibg=#f3ebea
   hi Directory gui=none guifg=#703939
   hi Title gui=none guifg=#703939
   hi CursorLine guibg=#fff6f6
   hi StatusLineNC gui=none guifg=#777777 guibg=#e2dad8 
   hi StatusLine gui=none guifg=#444444 guibg=#ffffff
   hi VertSplit gui=bold,underline guifg=#a8a2a2 guibg=#f3ebea
   hi Conceal gui=none guifg=#f3ebea guibg=#f3ebea
   hi Comment gui=none guifg=#8e8888
   hi Todo gui=none guifg=#444444 guibg=#ffffff
   hi Folded gui=underline guifg=#777777 guibg=#f3ebea
   hi FoldColumn gui=none guifg=#fff6f6 guibg=#777777
   hi TabLine gui=none guifg=#cfc8c6 guibg=#777777
   hi TabLineSel gui=none guifg=#444444 guibg=#f3ebea
   hi TabLineFill gui=none guifg=#cfc8c6 guibg=#444444
else
   hi Normal gui=none guifg=#cecece guibg=#222222
   hi Directory gui=none guifg=#703939
   hi Title gui=none guifg=#703939 
   hi CursorLine guibg=#181818 
   hi StatusLineNC gui=none guifg=#777777 guibg=#444444 
   hi StatusLine gui=none guifg=#777777 guibg=#000000
   hi VertSplit gui=bold,underline guifg=#444444 guibg=#222222
   hi Conceal gui=none guifg=#222222 guibg=#222222
   hi Comment gui=none guifg=#777777
   hi Todo gui=none guifg=#ffffff guibg=#444444
   hi Folded gui=underline guifg=#777777 guibg=#222222
   hi FoldColumn gui=none guifg=#777777 guibg=#000000
   hi TabLine gui=none guifg=#cfc8c6 guibg=#444444
   hi TabLineSel gui=none guifg=#cecece guibg=#222222
   hi TabLineFill gui=none guifg=#cfc8c6 guibg=#777777
endif

hi SpecialKey gui=none guifg=#b95e30
hi NonText gui=none guifg=#cfc8c6
hi ErrorMsg gui=none guifg=#fff6f6 guibg=#800000
hi IncSearch gui=none guifg=#000000 guibg=#ffe568
hi Search gui=none guifg=#444444 guibg=#ffe568
hi MoreMsg gui=none guifg=#b95e30
hi ModeMsg gui=none guifg=#326f62
hi LineNr gui=none guifg=#ffe568 guibg=#444444 
hi Question gui=none guifg=#2e8b57
hi Visual gui=none guifg=#ffffff guibg=#444444 
hi VisualNOS gui=underline guifg=#ffffff guibg=#777777
hi WarningMsg gui=none guifg=#ffffff guibg=#800000 
hi WildMenu gui=none guifg=#ffffff guibg=#800000
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText 
"hi SignColumn
"hi SpellBad
"hi SpellCap
"hi SpellRare
"hi SpellLocal
"hi Pmenu
"hi PmenuSel
"hi PmenuThumb
"hi CursorColumn
"hi ColorColumn
hi Cursor gui=none guifg=#ffffff guibg=#a8a2a2
"hi lCursor
"hi MatchParen
hi Constant gui=none guifg=#bb4747
hi Special gui=none guifg=#aea370 
hi Identifier gui=none guifg=#73739f 
hi Statement gui=none guifg=#7e6f68 
hi PreProc gui=none guifg=#804000
hi Type gui=none guifg=#326f9d
hi Underlined gui=underline guifg=#444444 
hi link Ignore Comment
hi Error gui=none guifg=#ffffff guibg=#b95e30
hi String gui=none guifg=#b95e30
hi Character gui=none guifg=#326f62
hi Number gui=none guifg=#aea370
hi Boolean gui=none guifg=#800000
hi Float gui=none guifg=#326f9d
hi Function gui=none guifg=#8fa4b5
hi Conditional gui=none guifg=#326f62 
hi Repeat gui=none guifg=#aea370
hi link Label String
hi Operator gui=none guifg=#326f9d
hi Keyword gui=none guifg=#326f9d 
hi Exception gui=none guifg=#800000
hi Include gui=none guifg=#326f9d
hi link Define String 
hi Macro gui=none guifg=#326f62
hi Precondit gui=none guifg=#aea370 
hi link StorageClass String
hi link Structure String
hi Typedef gui=none guifg=#326f62 
hi Tag gui=none guifg=#326f9d
hi SpecialChar gui=none guifg=#326f62 
hi Delimiter gui=none guifg=#7e6f68 
hi SpecialComment gui=none guifg=#aea370 
hi Debug gui=none guifg=#2e8b57 
hi CursorIM gui=none guifg=#cba3a3 guibg=#cba3a3
hi browseSuffixes gui=none guifg=#326f9d 

hi link treeOpenable Precondit
hi link treeHelpTitle Normal
hi link treeFile Tag
hi link treeExecFile String
hi link treeLink Comment
hi link treeRO Statement
hi link netrwPlain Tag
hi link netrwComment Normal
hi link netrwExe String
hi link netrwSymLink Comment
hi link netrwSpecial Statement
hi link netrwTime Number
hi link netrwTimeSep Number
hi link netrwDateSep Statement
hi link netrwSizeDate Statement

hi link VimwikiHeader1 htmlH1
hi link VimwikiHeader2 htmlH2
hi link VimwikiHeader3 htmlH3
hi link VimwikiHeader4 htmlH4
hi link VimwikiHeader5 htmlH5
hi link VimwikiHeader6 htmlH6
hi VimwikiEmoticons guifg=#444444 guibg=#ffe568
hi link VimwikiLink htmlLink
hi link VimwikiLinkT htmlLink
hi link VimwikiHeaderChar Comment
hi VimwikiCellSeparator gui=inverse

hi link vikiHyperLink htmlLink
"hi link vikiHeading
hi link vikiList Operator
"hi link vikiTableHead
"hi link vikiTableRow
"hi link vikiSymbols
"hi link vikiMarkers
hi link vikiAnchor htmlString 
hi link vikiString String
hi vikiBold gui=bold
hi vikiItalic gui=italic
hi vikiUnderline gui=underline
hi vikiTypewriter guifg=#7e6f68
hi link vikiCommand Comment

hi link markdownValid Normal
" hi link markdownLineStart
hi link markdownH1 htmlH1 
hi link markdownH2 htmlH2
hi link markdownH3 htmlH3 
hi link markdownH4 htmlH4
hi link markdownH5 htmlH5
hi link markdownH6 htmlH6
hi link markdownBlockquote String
hi link markdownListMarker Operator
hi link markdownOrderedListMarker markdownListMarker
hi link markdownCodeBlock markdownCode
hi markdownLineBreak guibg=#444444
hi link markdownLinkText htmlLink
hi markdownCode guifg=#7e6f68
hi markdownEscape guifg=#326f9d
hi link markdownHeadingRule Comment
hi link markdownHeadingDelimiter Comment
hi link markdownLinkDelimiter Comment
hi link markdownUrl htmlString
"hi markdownIdDeclaration
hi link markdownUrlTitle Label
hi link markdownUrlDelimiter Comment
hi link markdownUrlTitleDelimiter Comment
hi link markdownRule Comment
hi link markdownLinkTextDelimiter Comment
"hi markdownLink
"hi markdownId
"hi markdownIdDelimiter
hi link markdownAutomaticLink htmlLink
hi markdownBoldItalic gui=bold,italic
"hi markdownCodeDelimiter
hi markdownBold gui=bold
hi markdownItalic gui=italic

hi link rest1 htmlH1 
hi link rest2 htmlH2
hi link rest3 htmlH3 
hi link rest4 htmlH4
hi link rest5 htmlH5
hi link rest6 htmlH6

hi link pandocBlockQuote markdownBlockquote
hi link pandocCodeBlock markdownCode
hi link pandocDelimitedCodeBlock markdownCode
hi link pandocDelimitedCodeBlockLanguage markdownCode
hi link pandocCodePre markdownCode

hi link pandocLinkArea Comment
hi link pandocLinkText markdownLinkText
hi link pandocLinkURL	htmlLink
hi link pandocLinkTextRef markdownLinkText
hi link pandocLinkTitle markdownLinkText
hi link pandocAutomaticLink htmlLink

hi link pandocHRule	Comment

hi link pandocPCite markdownLinkText

hi htmlBoldUnderline gui=bold,underline
hi htmlBoldItalic gui=bold,italic
hi htmlBold gui=bold
hi htmlBoldUnderlineItalic gui=bold,underline,italic
hi link htmlBoldItalicUnderline htmlBoldUnderlineItalic 
hi link htmlUnderlineBold htmlBoldUnderline
hi htmlUnderlineItalic gui=underline,italic
hi htmlUnderline gui=underline
hi link htmlUnderlineBoldItalic htmlBoldUnderlineItalic
hi link htmlUnderlineItalicBold htmlBoldUnderlineItalic
hi link htmlItalicBold htmlBoldItalic
hi link htmlItalicUnderline htmlUnderlineItalic
hi htmlItalic gui=italic
hi link htmlItalicBoldUnderline htmlBoldUnderlineItalic
hi link htmlItalicUnderlineBold htmlBoldUnderlineItalic
hi link htmlTitle Title
hi link htmlCssStyleComment Comment
hi link htmlScriptTag htmlTag
hi link htmlEventSQ htmlEvent
hi link htmlEventDq htmlEvent
hi link htmlStyleArg htmlString
"hi htmlHighlight
"hi htmlHightlightSkip
hi link htmlSpecial Special
hi htmlStatement guifg=#cba3a3 
hi htmlEndTag guifg=#cba3a3
hi htmlTag guifg=#cba3a3
hi htmlTagN guifg=#cba3a3
hi htmlTagName guifg=#cba3a3
hi htmlSpecialTagName guifg=#cba3a3
hi htmlArg gui=italic guifg=#cba3a3 
hi htmlString gui=none guifg=#7e6f68 
hi htmlValue gui=none guifg=#b9917d
hi htmlSpecialChar guifg=#8fa4b5
hi htmlLink guifg=#6a5acd gui=none
hi htmlH1 guifg=#b95e30 gui=none
hi htmlH2 guifg=#b95e30 gui=italic
hi htmlH3 guifg=#326f9d gui=none
hi htmlH4 guifg=#326f9d gui=italic
hi htmlH5 guifg=#804000 gui=none
hi htmlH6 guifg=#804000 gui=italic

hi link xmlTagName htmlTagName
hi link xmlTag htmlTag
hi link xmlEndTag htmlTag

hi link phpFunctions Function
hi link phpOperator Operator
hi link phpStructure Structure
hi link phpSpecial Special

hi link twitterLink htmlLink
hi link twitterTime Number

hi link textEmotion textEmoticons
hi textEmoticons guifg=#444444 guibg=#ffe568
hi link textSection Directory
hi link textDialogue Tag
hi link textAction Special
hi link textLineEnd Comment
hi link textKoppa String

" Color palette
" =============
" #f3ebea cream, used for the background
" #e2dad8 slightly darker cream
" #cfc8c6 cream dark enough to be called beige
" #a8a2a2 darker beige for fold background
" #8e8888 very dark beige
" #fff6f6 light cream for fold text, cursorline
" ----
" #2e8b57 plain ol' green
" #326f62 hunter green
" #808e7a pale dark green
" ----
" #800000 what a maroon!
" #623232 very dark red for title
" #804000 rich brown
" ----
" #b95e30 dark fire orange
" #aea370 mustard
" #ffe568 deep bright yellow
" ----
" #777777 dark gray
" #444444 very dark gray
" ----
" #326f9d rubber stamp blue
" #73739f slightly muted blue
" #6a5acd purpleblue ink
" ----
" #cba3a3 pink for html
" #7e6f68 tame brown for html
" #b9917d tame light brown for html
" #8fa4b5 sky blue for html

