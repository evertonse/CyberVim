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
  use { "wbthomason/packer.nvim", commit = ""  } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = ""  } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = ""  } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = ""  }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = ""  }
  use { "kyazdani42/nvim-web-devicons", commit = ""  }
  use { "kyazdani42/nvim-tree.lua", commit = ""  }
  use { "akinsho/bufferline.nvim", commit = ""  }
	use { "moll/vim-bbye", commit = ""  }
  use { "nvim-lualine/lualine.nvim", commit = ""  }
  --use { "akinsho/toggleterm.nvim",  } -- Toggle Terminal
  use { "NvChad/nvterm", commit = ""  } --Nv Chad Toggle Terminal, just another option
  use { "ahmedkhalf/project.nvim", commit = ""  }
  use { "lewis6991/impatient.nvim", commit = ""  }
  use { "lukas-reineke/indent-blankline.nvim", commit = ""  }
  use { "goolord/alpha-nvim", commit = ""  }
	use {"folke/which-key.nvim", commit = ""}

	-->> Cmp 
  use { "hrsh7th/nvim-cmp", commit = ""  } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = ""  } -- buffer completions
  use { "hrsh7th/cmp-path", commit = ""  } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = ""  } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = ""  }
	use { "hrsh7th/cmp-nvim-lua", commit = ""  }

	-->> Snippets
  use { "L3MON4D3/LuaSnip", commit = ""  } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = ""  } -- a bunch of snippets to use
	-->> LSP

	use { "neovim/nvim-lspconfig", commit = ""  } -- enable LSP
  use { "williamboman/mason.nvim", commit = "" } -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = ""  }
	use { "jose-elias-alvarez/null-ls.nvim", commit = ""  } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = ""  }

	-->> Telescope
	use { "nvim-telescope/telescope.nvim", commit = "a606bd10c79ec5989c76c49cc6f736e88b63f0da"  }
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
    --"00b42ac6d4c852d34619eaf2ea822266588d75e3" --[Does Not Work] @type.qualifier and @storageclass on Nov 6, 2022
    --"ae104a057fc4164af8884f0b5540c79be95f5fc5"  --[does not work] fix: update scheme queries to parser change
    --"1fa45d8c793282d9a65044666e977220f91a2dd7"  --web-flow authored and clason committed on Nov 6, 2022
    --"dd89cafd2bc5ddbb201b6b1ea72ecd11acbe4e31" -- nov 5 2022
    --"a4b10b60c16ca141ca1dae538479889dd6932270" -- nov 2 2022
    --"e7bdcee167ae41295a3e99ad460ae80d2bb961d7" -- nov 1 2022
    "7709eb4b47b8ee19e760aa2771c5735fda2798e1" -- [Works]Disable folding at startup nov 1
    -- "80503a99104e461599ef8810a64bce1b6d235f6a" -- [Works]31 oct 2022
    --"287ffdccc1dd7ed017d844a4fad069fd3340fa94" --[Works] Add regex injections for php (Verified) on Oct 28, 2022
    --"c9241287719ccd38741850765649a25b09bdb4c2" --[Works] highlights(python): add "except*" Oct 25, 2022
    --"9b43ab819c756f01d2977cd481bdcaead6867174" --highlights: use @preproc where appropriate Oct 15, 2022
	  --"b945aa0aab03d4817a42cbcb27059217d8e56ed8" --highlights(c): highlight standard streams on Oct 15, 2022
    --"179a06bc8b4b028960dc105feceb5a4b1cbcb41d" --style: fix code styling according to Stylua  Oct 3, 2022
    --"8e763332b7bf7b3a426fd8707b7f5aa85823a5ac" --[Works] Commits [stable] - works with every plugin] Oct 2, 2022 
	}

  --use {'nvim-treesitter/playground'}
  use 'octol/vim-cpp-enhanced-highlight'
  -- Argument Coloring
  use { 'm-demare/hlargs.nvim', requires = { 'nvim-treesitter/nvim-treesitter' } }

	-->> Git
	use { "lewis6991/gitsigns.nvim",  }

	-->> Colorschemes
  --use 'marko-cerovac/material.nvim'
  --use { "folke/tokyonight.nvim",  }
  -- use { "lunarvim/darkplus.nvim",  }
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
  use {'evertonse/vs.nvim', branch = "base"} -- use this for bare minimum, first commit and base branch
  --use {'evertonse/vs.nvim' , branch = "dev"}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins

  
  if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
