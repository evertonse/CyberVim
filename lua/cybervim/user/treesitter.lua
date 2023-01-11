local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
 -- run = ':TSPUpdate',
  ensure_installed = {
    'help', "cpp", "c" , "json", 
    "lua", "python", 
    --"typescript", "toml","tsx", "css", 
    --"rust", 
    --"java", "yaml", "markdown", 
    --"markdown_inline",
    'vim' 
  }, -- one of "all" or a list of languages
  sync_install = false,	
  auto_install = false,
  ignore_install = {  }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
    custom_captures = {},
	},

	autopairs = {
		enable = true,
	},

	indent = { enable = true, disable = { } },
  --markid = { enable = false},
   query_linter = {
     enable = false,
     use_virtual_text = true,
     lint_events = {"BufWrite", "CursorHold"},
   },
  illuminate = {
    enable = true,
    loaded = true,
  },

  incremental_selection = {
    disable = {},
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_decremental = "grm",
      node_incremental = "grn",
      scope_incremental = "grc"
    },
  },

  context_commentstring = {
    enable = true
  },

  playground = {
    enable = true,
    disable = {},
    updatetime = 250, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>sn'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>sN'] = '@parameter.inner',
      },
    },
  },
})
