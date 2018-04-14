call plug#begin('~/.vim/bundle')

" Display
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'

" Shell
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Editing
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Utils.
Plug 'junegunn/vim-slash'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'sjl/gundo.vim', { 'on': ['GundoToggle', 'GundoShow'] }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Projects
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-scriptease'

" Languages
Plug 'chr4/nginx.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'

" Text object.
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'gilligan/textobj-gitgutter'
Plug 'PeterRincker/vim-argumentative'

" Tests / Lint
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" Local

" This requires fzf to be installed through homebrew: `brew install fzf`.
Plug '/usr/local/opt/fzf'

Plug '~/code/src/github.com/aliou/bats.vim'
Plug '~/code/src/github.com/aliou/cargo.vim'
Plug '~/code/src/github.com/aliou/dope.vim'
Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/irssi.vim'
Plug '~/code/src/github.com/aliou/jekyll.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/mix.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/phx.vim'
Plug '~/code/src/github.com/aliou/review.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'
Plug '~/code/src/github.com/aliou/untitled.vim'
Plug '~/code/src/github.com/aliou/wren.vim'

call plug#end()
