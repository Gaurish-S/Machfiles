local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "gaurish.lsp.lsp-installer"
require("gaurish.lsp.handlers").setup()
