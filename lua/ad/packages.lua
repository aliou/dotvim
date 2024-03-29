vim.cmd [[ packadd packer.nvim ]]

local packages = {
  { 'wbthomason/packer.nvim', opt = true },

  -- Display
  { 'itchyny/lightline.vim' },
  { 'mhinz/vim-startify' },
  { 'MunifTanjim/nui.nvim' },
  { 'projekt0n/github-nvim-theme' },

  -- Shell
  { 'tpope/vim-dispatch' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },

  -- Editing
  { 'AndrewRadev/splitjoin.vim' },
  { 'andymass/vim-matchup' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-surround' },
  { 'mg979/vim-visual-multi' },

  -- Utils.
  {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-vinegar' },
  { 'junegunn/fzf.vim' },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { "nvim-telescope/telescope-live-grep-args.nvim" }
    }
  },

  -- Projects
  { 'tpope/vim-apathy' },
  { 'tpope/vim-bundler' },
  { 'tpope/vim-obsession', cmd = { 'Obsession' } },
  { 'tpope/vim-projectionist' },
  { 'tpope/vim-rails', opt = true },
  { 'tpope/vim-rake', opt = true },

  -- Languages
  { 'ap/vim-css-color' },
  { 'chr4/nginx.vim' },
  { 'elixir-editors/vim-elixir' },
  { 'hashivim/vim-terraform' },
  { 'keith/swift.vim' },
  { 'lifepillar/pgsql.vim' },
  { 'tbastos/vim-lua' },
  { 'vim-ruby/vim-ruby' },
  { 'vito-c/jq.vim' },
  { 'jxnblk/vim-mdx-js' },
  {
    'simrat39/rust-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap'
    }
  },
  {
    'xbase-lab/xbase',
    run = 'make install',
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig"
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },

  -- Text object.
  { 'PeterRincker/vim-argumentative' },
  { 'kana/vim-textobj-user' },

  -- Tests / Lint / LSP
  { 'janko-m/vim-test' },
  { 'neovim/nvim-lspconfig' },
  { "williamboman/mason.nvim" },
  { "dnlhc/glance.nvim" },
  -- TODO: Replace with fork.
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Treesitter configuration and abstraction.
  { 'nvim-treesitter/nvim-treesitter' },
  { 'RRethy/nvim-treesitter-endwise' },
  { 'nvim-treesitter/playground' },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-copilot',
      'github/copilot.vim',
      'L3MON4D3/LuaSnip',
    }
  },

  -- Local plugins.

  -- This requires fzf to be installed with brew:
  -- `brew install fzf`.
  '/opt/homebrew/opt/fzf',

  '~/code/src/github.com/aliou/bats.vim',
  '~/code/src/github.com/aliou/dope.vim',
  '~/code/src/github.com/aliou/hybrid.vim',
  { '~/code/src/github.com/aliou/mando', rtp = 'vim' },
  '~/code/src/github.com/aliou/markoff.vim',
  '~/code/src/github.com/aliou/mix.vim',
  '~/code/src/github.com/aliou/moriarty.vim',
  '~/code/src/github.com/aliou/phx.vim',
  '~/code/src/github.com/aliou/pnpm.nvim',
  '~/code/src/github.com/aliou/review.vim',
  '~/code/src/github.com/aliou/ri.vim',
  '~/code/src/github.com/aliou/rspec-extra.vim',
  '~/code/src/github.com/aliou/sql-heredoc.vim',
  '~/code/src/github.com/aliou/untitled.vim',
  '~/code/src/github.com/aliou/wren.vim',
}

local config = { snapshot_path = vim.fn.expand('~/.vim') }
require('packer').startup({ packages, config = config, rocks = {} })

-- TODO: Checksum and auto update of packages.
local snapshot_name = '.packages-snapshot'

vim.api.nvim_del_user_command('PackerSnapshot')
vim.api.nvim_create_user_command('PackerSnapshot', function()
  vim.ui.notify_with_level(vim.log.levels.DEBUG, function()
    require('packer').snapshot(snapshot_name)
  end)
end, { desc = 'serialize installed plugins' })

vim.api.nvim_del_user_command('PackerSnapshotRollback')
vim.api.nvim_create_user_command('PackerSnapshotRollback', function()
  vim.ui.notify_with_level(vim.log.levels.DEBUG, function()
    require('packer').rollback(snapshot_name)
  end)
end, { desc = 'rollbacks plugins to version in snapshot' })
