vim.cmd [[packadd packer.nvim]]

-- Set termguicolors to true, required by multiple things
vim.opt.termguicolors = true

local packer = require('packer').startup(function() 
	use {'wbthomason/packer.nvim'} -- Package manager

		--LSP autocomplete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	--File browsing
	use 'nvim-telescope/telescope-file-browser.nvim'

	--Buffer navigation
	use 'nvim-lualine/lualine.nvim'


	--Grammar checking because I can't english
	use 'rhysd/vim-grammarous'

	use {'tpope/vim-surround'}
	use {'folke/tokyonight.nvim'}
	use {'tiagovla/tokyodark.nvim'}
	use {'drewtempelmeyer/palenight.vim'}
	use { "ellisonleao/gruvbox.nvim" } -- requires neovim 0.7 or higher


	--Telescope Requirements
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'


	--Telescope
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	--todo comments
	use 'folke/todo-comments.nvim'

	--devicons
	use 'kyazdani42/nvim-web-devicons'
end)


-- LSP autocomplete
vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
snippet = {
  expand = function(args)
	require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
mapping = {
  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

  ['<Tab>'] = function(fallback)
	if cmp.visible() then
  		cmp.select_next_item()
	else
  		fallback()
	end
   end,
  ['<S-Tab>'] = function(fallback)
	if cmp.visible() then
  		cmp.select_prev_item()
	else
  	   fallback()
	end
   end,
  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-e>'] = cmp.mapping({
	i = cmp.mapping.abort(),
	c = cmp.mapping.close(),
  }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
},
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'buffer' },
})
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconf = require('lspconfig')
lspconf.gopls.setup{
	capabilities = capabilities
}
lspconf.pyright.setup{
	capabilities = capabilities
}
lspconf.clangd.setup{
	capabilities = capabilities
}

return packer
