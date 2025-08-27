return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup{}
    vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", {noremap = true, silent = true})
  end
}

