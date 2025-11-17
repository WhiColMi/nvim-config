local M = {}

function M.setup()
  local lsp_splits = require("lsp-splits.lsp-splits")

  local opts = { buffer = bufnr, silent = true, noremap = false }
  vim.keymap.set('n', 'K', lsp_splits.hover, opts)
  vim.keymap.set('n', '<leader>e', lsp_splits.error, opts)
  vim.keymap.set('n', 'gd', lsp_splits.definition, opts)
  vim.keymap.set('n', 'gr', lsp_splits.references, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', lsp_splits.code_actions, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>gs', lsp_splits.signature_help, opts)
end

return M
