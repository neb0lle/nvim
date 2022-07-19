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
	use 'nvim-lua/plenary.nvim' 
	-- use 'foo1/bar1.nvim' 
	-- use 'foo1/bar1.nvim' 
	-- use 'foo1/bar1.nvim' 

	if packer_bootstrap then
		require('packer').sync()
	end
end)