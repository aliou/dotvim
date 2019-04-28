let g:plug_shallow = 1
call plug#begin('~/.vim/bundle')

" Display
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
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
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Utils.
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Projects
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-scriptease'

" Languages
Plug 'elixir-editors/vim-elixir'
Plug 'lifepillar/pgsql.vim'

" Text object.
Plug 'kana/vim-textobj-user'
Plug 'gilligan/textobj-gitgutter'
Plug 'PeterRincker/vim-argumentative'
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-line'

" Tests / Lint
Plug 'janko-m/vim-test'
Plug 'w0rp/ale'

" Local

" This requires fzf to be installed with go: `go get github.com/junegunn/fzf -u`.
Plug '~/code/src/github.com/junegunn/fzf'

Plug '~/code/src/github.com/aliou/bats.vim'
Plug '~/code/src/github.com/aliou/dope.vim'
Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/irssi.vim'
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/mix.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/phx.vim'
Plug '~/code/src/github.com/aliou/review.vim'
Plug '~/code/src/github.com/aliou/scratch.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'
Plug '~/code/src/github.com/aliou/untitled.vim'
Plug '~/code/src/github.com/aliou/wren.vim'
Plug '~/code/src/github.com/aliou/xcode.vim'
Plug '~/code/src/github.com/aliou/xxxx.vim'

call plug#end()
