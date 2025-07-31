local M = {}

function M.setup()
  local ok, toggleterm = pcall(require, "toggleterm")
  if ok then
    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = { border = "curved" },
    })
  end

  vim.keymap.set("n", "<leader>ps", function()
    require("bun-scripts-picker.picker").run()
  end, { desc = "Run package.json script picker" })
end

return M

