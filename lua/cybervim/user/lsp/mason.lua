local servers = {
  "clangd",
  "sumneko_lua",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	--"jsonls",
	-- "yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "ﰭ",
      -- look here https://www.nerdfonts.com/cheat-sheet
      --羽ﲊ精ﰭ
			--package_pending = "",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 1,
}

require("mason.settings").set(settings)
