return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
        }
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal right<CR>', {})
    vim.keymap.set('n', ',', function()
      local cwd = vim.fn.getcwd()                      -- current working dir
      local parent = vim.fn.fnamemodify(cwd, ":h")    -- parent directory
      vim.cmd("cd " .. parent)                         -- change cwd
      vim.notify("CWD: " .. parent)
    end, { noremap = true, silent = true })
  end
}
