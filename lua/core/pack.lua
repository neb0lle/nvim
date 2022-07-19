-- Auto install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path })
	end

-- Autoreload
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pack.lua source <afile> | PackerSync
  augroup end
]]

-- Plugins
return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim' 
	use 'folke/tokyonight.nvim'
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use 'jiangmiao/auto-pairs'
	use 'tpope/vim-surround'
	use 'numToStr/Comment.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'tpope/vim-fugitive'
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
	use 'vimwiki/vimwiki'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'christoomey/vim-tmux-navigator'
	use 'glepnir/dashboard-nvim'

	if packer_bootstrap then
		require('packer').sync()
	end
end)