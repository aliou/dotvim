vim.cmd [[ packadd packer.nvim ]]

local spec = function()
  use { 'wbthomason/packer.nvim', opt = true }

  -- Display
  use { 'itchyny/lightline.vim' }
  use { 'mhinz/vim-startify' }
  use { 'junegunn/goyo.vim', opt = true }
  use { 'MunifTanjim/nui.nvim' }
  use { 'projekt0n/github-nvim-theme' }
  use { 'p00f/alabaster_dark.nvim', requires = { 'rktjmp/lush.nvim' } }

  -- Shell
  use { 'tpope/vim-dispatch' }
  use { 'tpope/vim-eunuch' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-rhubarb' }

  -- Editing
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'andymass/vim-matchup' }
  use { 'tpope/vim-commentary' }
  use { 'RRethy/nvim-treesitter-endwise' }
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
  use { 'junegunn/fzf.vim' }

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
  use { 'chr4/nginx.vim' }
  use { 'elixir-editors/vim-elixir' }
  use { 'hashivim/vim-terraform' }
  use { 'keith/swift.vim' }
  use { 'lifepillar/pgsql.vim' }
  use { 'tbastos/vim-lua' }
  use { 'vim-ruby/vim-ruby' }
  use { 'vito-c/jq.vim' }

  -- Text object.
  use { 'PeterRincker/vim-argumentative' }

  -- Tests / Lint / LSP
  use { 'janko-m/vim-test' }
  use { 'neovim/nvim-lspconfig' }
  use { 'tjdevries/lsp_extensions.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Treesitter configuration and abstraction.
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
    }
  }

  -- Telescope.
  use {
    '~/code/src/github.com/aliou/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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
