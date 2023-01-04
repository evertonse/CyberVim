local fn = vim.fn
-->> Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd[[packadd packer.nvim]]
end

-->> Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-->> Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-->> Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-->> Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }
  use { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" }
  use { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" }
  use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
	use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  --use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" } -- Toggle Terminal
  use { "NvChad/nvterm", commit = "29a70ef608a8cc5db3a5fc300d39a39d1a44a863" } --Nv Chad Toggle Terminal, just another option
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
	use {"folke/which-key.nvim"}

	-->> Cmp 
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

	-->> Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use
	-->> LSP

	use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }

	-->> Telescope
	use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
	-->> Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
    commit = 
    --"12e95e160d7d45b76a36bca6303dd8447ab77490" -- Commits on Jan 2, 2023
    --"d31c71c959348b7b15f7e69608a47aea05ed7bc6" -- Commits on Dec 14, 2022
    --"256802258084fcf6c7011dae4c3fbfaaf4b61518" -- Commits on Dec 1, 2022
    --"4b900527045c49af5f43291d2cb13ae27a3bc7be" -- Nov 30, 2022
    --"d1eaf23c9ec9aca91e219ed82ae98c96d93dd407" -- 29 nov 2022
    --"1a767376cdb968f43af690ccac7001d2efbefb87" --ObserverOfTime committed on Nov 26, 2022
    --"79705a1f80297d1f3178d2b30423760c060afa4a" --highlights(cpp): use more specific groups ObserverOfTime committed on Nov 26, 2022
    --"7ce62670b2e0946e3f586f3f07a584f642b02b9b" --highlights(c): use more specific groups 
    --"00b42ac6d4c852d34619eaf2ea822266588d75e3" -- @type.qualifier and @storageclass on Nov 6, 2022
    --"287ffdccc1dd7ed017d844a4fad069fd3340fa94" --Add regex injections for php (Verified) on Oct 28, 2022
    --"c9241287719ccd38741850765649a25b09bdb4c2" --highlights(python): add "except*" Oct 25, 2022
    --"9b43ab819c756f01d2977cd481bdcaead6867174" --highlights: use @preproc where appropriate Oct 15, 2022
	  --"b945aa0aab03d4817a42cbcb27059217d8e56ed8"--highlights(c): highlight standard streams on Oct 15, 2022
    --"179a06bc8b4b028960dc105feceb5a4b1cbcb41d" --style: fix code styling according to Stylua  Oct 3, 2022
    "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac", -- Commits [stable - works with every plugin] Oct 2, 2022 
	}

  --use {'nvim-treesitter/playground'}
  
  -- Argument Coloring
  use { 'm-demare/hlargs.nvim',commit = "88b925d699fb39633cdda02c24f0b3ba5d0e6964", requires = { 'nvim-treesitter/nvim-treesitter' } }

	-->> Git
	use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }

	-->> Colorschemes
  --use 'marko-cerovac/material.nvim'
  --use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  -- use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  --use 'tomasiser/vim-code-dark'
  use 'dstein64/vim-startuptime'
  --use 'shaunsingh/nord.nvim'
  -- Another vs code theme:
  -- for more options see: https://github.com/Mofiqul/vscode.nvim
  --use 'Mofiqul/vscode.nvim'

  --[[ 
    Using my fork of Mofiqul vscode nvim theme, 
    but my theme is Focusing on Visual Studio Theme, rather tha vs code
  --]]
  use {'evertonse/vs.nvim',commit="a87ad02da3892247a355193837d90efa63581d33", branch = "base"} -- use this for bare minimum, first commit and base branch
  --use {'evertonse/vs.nvim' , branch = "dev"}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  
  if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
