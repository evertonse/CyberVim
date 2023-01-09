local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- require "cybervim.user.lsp.mason"
require("cybervim.user.lsp.handlers").setup()
require "cybervim.user.lsp.null-ls"
require "cybervim.user.lsp.trouble"
require "cybervim.user.lsp.lsp-zero"