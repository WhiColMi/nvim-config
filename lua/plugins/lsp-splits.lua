return {
  dir = vim.fn.stdpath("config") .. "/lua/lsp-splits",
  name = "lsp-splits",
  enabled = false,
  lazy = false,
  config = function()
    require("lsp-splits").setup()
  end
}
