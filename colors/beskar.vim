" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has('gui_running') && &t_Co != 88 && &t_Co != 256
  finish
endif

set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'mando'

" }}}
" Palette {{{
let s:mc = {}

" Our basic color.
let s:mc.plain          = ['f8f8f8', 15]

" MJ at two different points in his life.
let s:mc.white          = ['ffffff', 15]
let s:mc.black          = ['000000', 16]

" The gravel colors from Bad Wolf.
let s:mc.brightgravel   = ['d9cec3', 252]
let s:mc.lightgravel    = ['998f84', 245]
let s:mc.gravel         = ['857f78', 243]
let s:mc.mediumgravel   = ['666462', 241]
let s:mc.deepgravel     = ['45413b', 238]
let s:mc.deepergravel   = ['35322d', 236]
let s:mc.darkgravel     = ['242321', 235]
let s:mc.blackgravel    = ['1c1b1a', 233]
let s:mc.blackestgravel = ['141413', 232]

" The blue from Badwolf.
let s:mc.tardis         = ['0a9dff', 39]

" Made of Code's not quite red.
let s:mc.notquitered    = ['ff3854', 203]

" A beautiful tan from Tomorrow Night.
let s:mc.dirtyblonde    = ['f4cf86', 222]

" Base 16's 15th color.
let s:mc.base0E         = ['aa759f', 05]

" An orange from Base 16.
let s:mc.orange         = ['d08770', 209]

" A limy green from Badwolf.
let s:mc.lime           = ['aeee00', 154]

" Rose's dress in The Idiot's Lantern.
let s:mc.dress          = ['ff9eb8', 211]

" Jellybean's green.
let s:mc.jellygreen     = ['99ad6a', 150]

" The diff colors from jellybeans.
let s:mc.hotred         = ['700009', 196]

" Diff colors from hybrid.
let s:mc.hybridgreen    = ['5F875F', 65]
let s:mc.hybridblue     = ['5F5F87', 60]
let s:mc.hybridred      = ['CC6666', 167]

" Also based on that Clouds Midnight brown.
let s:mc.coffee         = ['c7915b', 173]
let s:mc.darkroast      = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  let l:histring = 'hi ' . a:group . ' '

  if strlen(a:fg)
    if a:fg ==# 'fg'
      let l:histring .= 'guifg=fg ctermfg=fg '
    else
      let l:c = get(s:mc, a:fg)
      let l:histring .= 'guifg=#' . l:c[0] . ' ctermfg=' . l:c[1] . ' '
    endif
  endif

  if a:0 >= 1 && strlen(a:1)
    if a:1 ==# 'bg'
      let l:histring .= 'guibg=bg ctermbg=bg '
    else
      let l:c = get(s:mc, a:1)
      let l:histring .= 'guibg=#' . l:c[0] . ' ctermbg=' . l:c[1] . ' '
    endif
  endif

  if a:0 >= 2 && strlen(a:2)
    let l:histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
  endif

  if a:0 >= 3 && strlen(a:3)
    let l:c = get(s:mc, a:3)
    let l:histring .= 'guisp=#' . l:c[0] . ' '
  endif

  " echom l:histring

  execute l:histring
endfunction
" }}}

" Vanilla Vim {{{

" General/UI {{{
call s:HL('Normal', 'plain', 'blackgravel')

call s:HL('Folded', 'mediumgravel', 'bg', 'none')

call s:HL('VertSplit', 'lightgravel', 'bg', 'none')

call s:HL('CursorLine',   '',       'darkgravel', 'none')
call s:HL('CursorLineNr', 'tardis', 'darkgravel', 'none')
call s:HL('CursorColumn', '',       'darkgravel')
call s:HL('ColorColumn',  '',       'darkgravel')

call s:HL('TabLine',     'plain', 'blackestgravel', 'none')
call s:HL('TabLineFill', 'plain', 'blackestgravel', 'none')
call s:HL('TabLineSel',  'black', 'tardis',         'none')

call s:HL('MatchParen', 'notquitered', 'darkgravel', 'bold')

call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')

call s:HL('Visual',    '',  'deepgravel')
call s:HL('VisualNOS', '',  'deepgravel')

call s:HL('Search',    'black', 'white', 'bold')
highlight IncSearch cterm=inverse gui=inverse
" call s:HL('IncSearch', 'black', 'dirtyblonde', 'bold')

call s:HL('Underlined', 'fg', '', 'underline')

call s:HL('StatusLine',   'black', 'tardis',     'none')
call s:HL('StatusLineNC', 'white', 'deepgravel', 'none')

call s:HL('Directory', 'tardis', '', 'bold')

call s:HL('Title', 'plain')

call s:HL('ErrorMsg',   'notquitered', 'bg', 'bold')
call s:HL('MoreMsg',    'dirtyblonde',      '',  'bold')
call s:HL('ModeMsg',    'dirtyblonde',  '',  'bold')
call s:HL('Question',   'dirtyblonde',  '',  'bold')
call s:HL('WarningMsg', 'base0E',       '',  'bold')

call s:HL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call s:HL('LineNr',     'mediumgravel', 'blackgravel')
call s:HL('SignColumn', '',             'blackgravel')
call s:HL('FoldColumn', 'mediumgravel', 'blackgravel')

" }}}
" Cursor {{{

call s:HL('Cursor',  'black', 'tardis', 'bold')
call s:HL('vCursor', 'black', 'tardis', 'bold')
call s:HL('iCursor', 'black', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

call s:HL('Special', 'plain')

call s:HL('Comment',        'gravel')
call s:HL('Todo',           'tardis', 'bg', 'bold')
call s:HL('SpecialComment', 'tardis', 'bg', 'bold')

call s:HL('String', 'plain', 'deepergravel')

call s:HL('Statement',   'plain', '', 'none')
call s:HL('Keyword',     'plain', '', 'none')
call s:HL('Conditional', 'plain', '', 'none')
call s:HL('Operator',    'plain', '', 'none')
call s:HL('Label',       'plain', '', 'none')
call s:HL('Repeat',      'plain', '', 'none')

call s:HL('Identifier', 'plain')
call s:HL('Function',   'plain', '', 'bold')

call s:HL('PreProc',   'plain', '', 'none')
call s:HL('Macro',     'plain', '', 'bold')
call s:HL('Define',    'brightgravel', '', 'none')
call s:HL('PreCondit', 'plain', '', 'bold')

call s:HL('Constant',  'plain', '', 'none')
call s:HL('Character', 'plain', '', 'none')
call s:HL('Boolean',   'plain', '', 'none')

call s:HL('Number', 'plain', '', 'none')
call s:HL('Float',  'plain', '', 'none')

call s:HL('SpecialChar', 'dress', '', 'none')

call s:HL('Type',         'plain',       '', 'bold')
call s:HL('StorageClass', 'notquitered', '', 'none')
call s:HL('Structure',    'notquitered', '', 'none')
call s:HL('Typedef',      'notquitered', '', 'none')

call s:HL('Exception', 'lime', '', 'none')

call s:HL('Error',  'white',   'notquitered', 'none')
call s:HL('Debug',  'white',   '',            'none')
call s:HL('Ignore', 'gravel',  '',            '')

" }}}
" Completion Menu {{{

call s:HL('Pmenu',      'plain', 'deepergravel')
call s:HL('PmenuSel',   'black', 'tardis', 'bold')
call s:HL('PmenuSbar',  '',      'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call s:HL('DiffAdd',    'plain', 'hybridgreen')
call s:HL('DiffDelete', 'black', 'hybridred')
call s:HL('DiffChange', 'plain', 'hybridblue')
call s:HL('DiffText',   'black', 'hybridblue', 'bold')

" }}}
" Spelling {{{

if has("spell")
  call s:HL('SpellCap',   'dirtyblonde', 'bg', 'undercurl,bold', 'dirtyblonde')
  call s:HL('SpellBad',   '',            'bg', 'undercurl',      'dirtyblonde')
  call s:HL('SpellLocal', '',            '',   'undercurl',      'dirtyblonde')
  call s:HL('SpellRare',  '',            '',   'undercurl',      'dirtyblonde')
endif

" }}}

" }}}

" Treesitter {{{
" call s:HL("TSAnnotation", '', '', '')

" call s:HL("TSAttribute", '', '', '')

" call s:HL("TSBoolean", '', '', '')

" call s:HL("TSCharacter", '', '', '')

" call s:HL("TSConditional", '', '', '')

" call s:HL("TSConstant", '', '', '')
" call s:HL("TSConstBuiltin", '', '', '')
" call s:HL("TSConstMacro", '', '', '')

" call s:HL("TSConstructor", '', '', '')

" call s:HL("TSError", '', '', '')
" call s:HL("TSException", '', '', '')

" call s:HL("TSField", '', '', '')

" call s:HL("TSFloat", '', '', '')

" call s:HL("TSFunction", '', '', '')
" call s:HL("TSFuncBuiltin", '', '', '')
" call s:HL("TSFuncMacro", '', '', '')

" call s:HL("TSInclude", '', '', '')

" call s:HL("TSKeyword", '', '', '')
" call s:HL("TSKeywordFunction", '', '', '')
" call s:HL("TSKeywordOperator", '', '', '')

" call s:HL("TSLabel", '', '', '')

" call s:HL("TSMethod", '', '', '')

" call s:HL("TSNamespace", '', '', '')

" call s:HL("TSNone", '', '', '')
" call s:HL("TSNumber", '', '', '')

" call s:HL("TSOperator", '', '', '')

" call s:HL("TSParameter", '', '', '')
" call s:HL("TSParameterReference", '', '', '')

" call s:HL("TSProperty", '', '', '')

" call s:HL("TSPunctDelimiter", '', '', '')
" call s:HL("TSPunctBracket", '', '', '')
" call s:HL("TSPunctSpecial", '', '', '')

" call s:HL("TSRepeat", '', '', '')

" call s:HL("TSString", '', '', '')
" call s:HL("TSStringRegex", '', '', '')
" call s:HL("TSStringEscape", '', '', '')

" call s:HL("TSTag", '', '', '')
" call s:HL("TSTagDelimiter", '', '', '')

" call s:HL("TSText", '', '', '')
" call s:HL("TSStrong", '', '', '')
" call s:HL("TSEmphasis", '', '', '')
" call s:HL("TSUnderline", '', '', '')
" call s:HL("TSTitle", '', '', '')
" call s:HL("TSLiteral", '', '', '')
" call s:HL("TSURI", '', '', '')

" call s:HL("TSType", '', '', '')
" call s:HL("TSTypeBuiltin", '', '', '')

" call s:HL("TSVariable", '', '', '')
" call s:HL("TSVariableBuiltin", '', '', '')
" }}}

" vim:foldmethod=marker
