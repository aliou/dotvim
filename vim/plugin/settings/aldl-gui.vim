" ===========================

" Pretty !
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme badwolf

" MacVim
if has('gui_running')
  colorscheme molokai
else
  colorscheme badwolf
endif

if has("gui_macvim")
  " Hides MacVim toolbar.
  set go-=T
  set go-=l
  set go-=T " Hides toolbar.
  set go-=l " Hides scrollbars.
  set go-=L
  set go-=r
  set go-=R
  " colorscheme molokai
endif

" Status Line


" Visual Cues

set laststatus=2               " Status Line
set showmatch                  " brackets/braces that is
set mat=5                      " duration to show matching brace (1/10 sec)
set visualbell                 " shut the fuck up
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive...
set smartcase                  " ... unless they contain at least one capital letter
set ruler                      " show the cursor position all the time
set showcmd                    " displays incomplete commands
set nolazyredraw               " turn off lazy redraw
set wildmenu                   " turn on wild menu
set wildmode=list:longest,full                " 
set wildignore=*.o,.DS_Store   " Ignore C objects files.
set ch=3                       " command line height
set backspace=2                " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]     " backspace and cursor keys wrap to
set shortmess=filtIoOA         " shorten messages
set report=0                   " tell us about changes
set nostartofline              " don't jump to the start of line when scrolling
set scrolloff=5
set cursorline                 " Highlights the current line.
set gdefault                   " By default add g flag to search/replace. Add g to toggle.

