" ===========================

" Pretty !
color molokai

" MacVim
if has("gui_macvim")
	" Hides MacVim toolbar.
	set go-=T
endif

" Status Line

set laststatus=2
set statusline=%t%h%y%m%r
set statusline+=%= 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*  
set statusline+=%c,%l/%L\ %P\ 

" Visual Cues

set showmatch                 " brackets/braces that is
set mat=5                     " duration to show matching brace (1/10 sec)
set visualbell                " shut the fuck up
set hlsearch                  " highlight matches
set incsearch                 " incremental searching
set ignorecase                " searches are case insensitive...
set smartcase                 " ... unless they contain at least one capital letter
set ruler                     " show the cursor position all the time
set showcmd                   " displays incomplete commands
set nolazyredraw              " turn off lazy redraw
set wildmenu                  " turn on wild menu
set wildmode=list:longest,full
set wildignore=*.o,.DS_Store  " Ignore C objects files.
set ch=3                      " command line height
set backspace=2               " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]    " backspace and cursor keys wrap to
set shortmess=filtIoOA        " shorten messages
set report=0                  " tell us about changes
set nostartofline             " don't jump to the start of line when scrolling
" set cursorline


