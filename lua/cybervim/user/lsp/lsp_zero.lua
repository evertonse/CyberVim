local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  print("[lsp.init.lua] We ain't got no lsp-zero")
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  'pyright',
  'jdtls',
  'clangd',
  'tsserver',
  'rust_analyzer',
})

--Options from .configure() will be merged with the ones on .use() and the server will be initialized.
--.use() can also take a list of servers. All the servers on the list will share the same options.

--- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

local flake_ignores = { "E203", -- whitespace before :
  "W503", -- line break before binary operator
  "E501", -- line too long
  "C901" } -- mccabe complexity
local pylsp_settings = {
  settings = {
    python = {
      plugins = {
        mccabe = { enabled = false },
        flake8 = {
          enabled = true,
          ignore = table.concat(flake_ignores, ",")
        }
      }
    },
  }
}
-- pylsp'vim'
lsp.configure('jdtls', {})

lsp.configure('pyright', pylsp_settings)

--lsp.setup_servers({
--  root_dir = true,
--  'rust_analyzer',
--  'pylsp',
--  opts = {
--    flags = {
--      debounce_text_changes = 200,
--    },
--    single_file_support = true,
--    on_attach = function(client, bufnr)
--      print("I'm rust i'm crab, or i'm pylsp, lsp has been attached")
--    end
--  }
--})

local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if null_ls_status_ok then
  local null_opts = lsp.build_options('null-ls', {})
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup({
    on_attach = function(client, bufnr)
      null_opts.on_attach(client, bufnr)
      ---
      -- you can add other stuff here....
      ---
    end,
    debug = false,

    sources = {
      formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.stylua,
      --diagnostics.flake8
    },
  })
end

lsp.set_preferences({
  suggest_lsp_servers = true,
  sign_icons = {
    error = '✘',
    warn  = '▲',
    hint  = '⚑',
    info  = '',
  }
})

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),  --['<C-space>'] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local ok, lspkind = pcall(require, "lspkind")
if not ok then
  return
end

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = kind_icons,
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  --keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

lsp.on_attach(function(client, bufnr)
  lsp_keymaps(bufnr)
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  --illuminate.on_attach(client)

  --local opts = {buffer = bufnr, remap = false}
  --  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  --  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  --  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  --  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  --  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  --  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  --  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  --  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  --  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  --  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

--lsp.nvim_workspace()

lsp.setup()


vim.diagnostic.config({
  virtual_text = true,
})
