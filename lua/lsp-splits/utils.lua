local M = {}

function M.create_split_buf()
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(bufnr, "filetype", "markdown")
  vim.api.nvim_buf_set_option(bufnr, "buftype", "nofile")
  vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(bufnr, "swapfile", false)
  return bufnr
end

function M.open_in_split(lines)
  local bufnr = M.create_split_buf()
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.cmd("rightbelow vsplit")
  vim.api.nvim_win_set_buf(0, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
end

return M
