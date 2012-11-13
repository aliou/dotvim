set t_Co=256
set background=dark
colorscheme smyck

if has("gui_macvim")
  colorscheme sift
  set go-=T " Hides toolbar.
  set go-=l " Hides scrollbars.
  set go-=L
  set go-=r
  set go-=R
  set guifont=Menlo:h13
endif

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
set wildmode=list:longest,full "
set wildignore=*.o,.DS_Store   " Ignore C objects files.
set ch=3                       " command line height
set backspace=2                " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]     " backspace and cursor keys wrap to
set shortmess=filtIoOA         " shorten messages
set report=0                   " tell us about changes
set nostartofline              " don't jump to the start of line when scrolling
set scrolloff=100000           " Always keep current line in the middle of the window.
set gdefault                   " By default add g flag to search/replace. Add g to toggle.
set textwidth=80               " Last but not least.
set foldmethod=syntax          " The foldings follows the syntax higlighting.

