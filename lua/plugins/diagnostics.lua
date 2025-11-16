return {
  -- LSPSaga: better floating windows for LSP
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
          title = true,
          expand = "",
          collapse = "",
          code_action = "💡",
        },
        diagnostic = {
          on_insert = false,
          insert_show = false,
          show_header = true,
          focusable = true,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        },
        -- lightbulb = { enable = true, enable_in_insert = true },
        lightbulb = { enable = false },
        symbol_in_winbar = { enable = false },
      })

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
      keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
      keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
      keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
      keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Trouble: project-wide diagnostics / references / lists
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        position = "bottom",
        height = 15,
        auto_open = false,
        auto_close = true,
        signs = {
          error = "",
          warning = "",
          hint = "",
          information = "",
        },
        use_diagnostic_signs = true,
      })

      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true }

      keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", opts)
      keymap("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", opts)
      keymap("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", opts)
    end,
  },
}
