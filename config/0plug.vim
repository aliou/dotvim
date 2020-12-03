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
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'

" Utils.
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-repeat'
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
Plug 'keith/swift.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'tbastos/vim-lua'

" Text object.
Plug 'PeterRincker/vim-argumentative'

" Tests / Lint
Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'

" nvim things
if has('nvim')
  " Collection of common configurations for the Nvim LSP client
  Plug 'neovim/nvim-lspconfig'

  " Extensions to built-in LSP, for example, providing type inlay hints
  Plug 'tjdevries/lsp_extensions.nvim'

  " Treesitter configuration and abstraction.
  Plug 'nvim-treesitter/nvim-treesitter'

  " Popup menu handling.
  Plug 'kamykn/popup-menu.nvim'

  Plug 'nvim-lua/completion-nvim'
  Plug 'kristijanhusak/completion-tags'
endif

" Local

" This requires fzf to be installed with go: `go get github.com/junegunn/fzf -u`.
Plug '~/code/src/github.com/junegunn/fzf'

Plug '~/code/src/github.com/aliou/bats.vim'
Plug '~/code/src/github.com/aliou/dope.vim'
Plug '~/code/src/github.com/aliou/hybrid.vim'
Plug '~/code/src/github.com/aliou/irssi.vim'
Plug '~/code/src/github.com/aliou/mando', { 'rtp': 'vim' }
Plug '~/code/src/github.com/aliou/markoff.vim'
Plug '~/code/src/github.com/aliou/mix.vim'
Plug '~/code/src/github.com/aliou/moriarty.vim'
Plug '~/code/src/github.com/aliou/phx.vim'
Plug '~/code/src/github.com/aliou/review.vim'
Plug '~/code/src/github.com/aliou/ri.vim'
Plug '~/code/src/github.com/aliou/rspec-extra.vim'
Plug '~/code/src/github.com/aliou/sql-heredoc.vim'
Plug '~/code/src/github.com/aliou/untitled.vim'
Plug '~/code/src/github.com/aliou/wren.vim'
Plug '~/code/src/github.com/aliou/xcode.vim'
Plug '~/code/src/github.com/aliou/xxxx.vim'

call plug#end()
