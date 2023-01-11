local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok, semantic_tokens = pcall (require, "nvim-semantic-tokens")
if status_ok then
  semantic_tokens.setup {
    preset = "default",
    -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or 
    -- function with the signature: highlight_token(ctx, token, highlight) where 
    --      ctx (as defined in :h lsp-handler)
    --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
    --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
    highlighters = { require 'nvim-semantic-tokens.table-highlighter'}
  }
end
require "cybervim.user.lsp.mason"
require("cybervim.user.lsp.handlers").setup()
require "cybervim.user.lsp.null-ls"
require "cybervim.user.lsp.trouble"
