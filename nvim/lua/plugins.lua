-- This file can be loaded by calling 'require('plugins') from init.lua

-- autocmd for automatically run PackerCompile when plugins.lua is updated
local augroup = vim.api.nvim_create_augroup('package_user_config', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
		group = augroup,
		pattern = 'plugins.lua',
		callback = function(args)
			vim.cmd.source(args.file)
			vim.cmd.PackerCompile()
		end,
		desc = "Compile Packer plugins source.",
	})

-- Enable automatic download and init of packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- list packages
return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'
	use 'tpope/vim-git'
	use 'tpope/vim-fugitive'
	use 'preservim/nerdcommenter'
	use 'tikhomirov/vim-glsl'
	use {
		'feline-nvim/feline.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		}
	}
	-- LSP
	use 'neovim/nvim-lspconfig'
	-- Autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		},
	}
	use 'powerman/vim-plugin-ansiesc'
	--use 'valloric/youcompleteme'
	use 'editorconfig/editorconfig-vim'
	use 'chiel92/vim-autoformat'
	use 'sheerun/vim-polyglot'
	use 'mhinz/vim-startify'
	use {
		'ms-jpq/chadtree',
		--config = function()
		--vim.api.nvim_command('python3 -m chadtree deps')
		--end
	}
	use {
		'sindrets/diffview.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		}
	}

	-- color schemes
	use 'jnurmine/zenburn'

	-- Automatically set up configuration after cloning packer.nvim
	-- Should be after all listed plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end
)
