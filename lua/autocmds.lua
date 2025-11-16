vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function(args)
    local lsp_client = vim.lsp.get_clients({ name = "dartls" })
    if lsp_client and #lsp_client > 0 then
      vim.lsp.buf_attach_client(args.buf, lsp_client[1].id)
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lspsagafloat",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
  end,
})
