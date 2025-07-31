return {
  dir = vim.fn.stdpath("config") .. "/lua/bun-scripts-picker",
  name = "bun-scripts-picker",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "akinsho/toggleterm.nvim",
  },
  config = function()
    require("bun-scripts-picker").setup()
  end
}
