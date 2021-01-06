local packer_install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_install_path)
  vim.api.nvim_command('packadd packer.nvim')
end

local packer = require('packer')

packer.startup(function ()
  local use = packer.use

  use 'wbthomason/packer.nvim'
  use 'editorconfig/editorconfig-vim'
  use { 'junegunn/fzf', run = './install --bin' }
  use 'junegunn/fzf.vim'
  use 'tpope/vim-fugitive'
  use 'justinmk/vim-dirvish'
  use 'morhetz/gruvbox'
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'dag/vim-fish'
  use 'jparise/vim-graphql'
end)

