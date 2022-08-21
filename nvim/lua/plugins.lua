vim.cmd [[packadd packer.nvim]]

local packer = require('packer').startup(function() 
	use {'wbthomason/packer.nvim'} -- Package manager
	use {'tpope/vim-surround'}
	use {'drewtempelmeyer/palenight.vim'}
	use {'akinsho/bufferline.nvim', tag = "*", requires = {'kyazdani42/nvim-web-devicons'}}
	use {'feline-nvim/feline.nvim'}
	use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
	use { "kelly-lin/telescope-ag", requires = { "nvim-telescope/telescope.nvim" } }
	use {'kyazdani42/nvim-tree.lua', requires = {
      		'kyazdani42/nvim-web-devicons', }}
	use { "ellisonleao/gruvbox.nvim" } -- requires neovim 0.7 or higher
	--Only use the following for autocompletion
	use {'ms-jpq/coq_nvim'}
	use {'neovim/nvim-lspconfig'} -- Collection of configurations for the built-in LSP client
end)
-- Set termguicolors to true, required by multiple things
vim.opt.termguicolors = true
-- Setup bufferline
require("bufferline").setup{}
-- Setup feline statusbar
require("feline").setup()
-- Add ag to telescope
require("telescope").load_extension("ag")

-- init lsp and coq to use for servers
local lsp = require "lspconfig"
local coq = require "coq"
-- setup C/C++ lsp
lsp.clangd.setup(coq.lsp_ensure_capabilities({}))

return packer

