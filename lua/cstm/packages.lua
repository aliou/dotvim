vim.cmd [[ packadd packer.nvim ]]

-- TODO: Clean and remove unused plugins.
local spec = function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- Display
  use { 'itchyny/lightline.vim' }
  use { 'machakann/vim-highlightedyank' }
  use { 'mhinz/vim-startify' }
  use { 'junegunn/goyo.vim', opt = true }

  -- Shell
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }

  -- Editing
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'andymass/vim-matchup' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-endwise' }
  use { 'tpope/vim-sleuth' }
  use { 'tpope/vim-surround' }
  use { 'mg979/vim-visual-multi' }

  -- Utils.
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'ludovicchabant/vim-gutentags' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-vinegar' }

  -- Projects
  use { 'tpope/vim-apathy' }
  use { 'tpope/vim-bundler' }
  use { 'tpope/vim-obsession', cmd = { 'Obsession' } }
  use { 'tpope/vim-projectionist' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-rake' }
  use { 'tpope/vim-scriptease' }

  -- Languages
  use { 'ap/vim-css-color' }
  use { 'elixir-editors/vim-elixir' }
  use { 'keith/swift.vim' }
  use { 'lifepillar/pgsql.vim' }
  use { 'tbastos/vim-lua' }
  use { 'vim-ruby/vim-ruby' }
  use { 'vito-c/jq.vim' }
  use { 'hashivim/vim-terraform' }

  -- Text object.
  use { 'PeterRincker/vim-argumentative' }

  -- Tests / Lint / LSP
  use { 'janko-m/vim-test' }
  use { 'neovim/nvim-lspconfig' }
  use { 'tjdevries/lsp_extensions.nvim' }

  -- Treesitter configuration and abstraction.
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Popup menu handling.
  -- TODO: Remove this with either a custom implementation or a "native" one in
  -- core (hopefully).
  use { 'kamykn/popup-menu.nvim' }

  -- Completion
  use { 'nvim-lua/completion-nvim' }
  use { 'kristijanhusak/completion-tags' }

  -- Local plugins.

  -- This requires fzf to be installed with go:
  -- `go get github.com/junegunn/fzf -u`.
  use '~/code/src/github.com/junegunn/fzf'

  use '~/code/src/github.com/aliou/bats.vim'
  use '~/code/src/github.com/aliou/dope.vim'
  use '~/code/src/github.com/aliou/hybrid.vim'
  use { '~/code/src/github.com/aliou/mando', rtp = 'vim' }
  use '~/code/src/github.com/aliou/markoff.vim'
  use '~/code/src/github.com/aliou/mix.vim'
  use '~/code/src/github.com/aliou/moriarty.vim'
  use '~/code/src/github.com/aliou/phx.vim'
  use '~/code/src/github.com/aliou/review.vim'
  use '~/code/src/github.com/aliou/ri.vim'
  use '~/code/src/github.com/aliou/rspec-extra.vim'
  use '~/code/src/github.com/aliou/sql-heredoc.vim'
  use '~/code/src/github.com/aliou/untitled.vim'
  use '~/code/src/github.com/aliou/wren.vim'
end

require('packer').startup(spec)
