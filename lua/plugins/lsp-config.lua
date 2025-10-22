return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "biome", "pyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = vim.lsp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true, noremap = false }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.definition, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      end
      lsp.config("lua_ls", { on_attach = on_attach, capabilities = capabilities })
      lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })
      lsp.config("biome", { on_attach = on_attach, capabilities = capabilities })
      lsp.config("dartls", { on_attach = on_attach, capabilities = capabilities })
      lsp.config("pyright", {
        on_attach = function(client)
          on_attach()
          client.config.settings.python.pythonPath = vim.fn.getcwd() .. '/venv/bin/python'
        end,
        capabilities = capabilities
      })
      vim.lsp.set_log_level("debug")
    end
  },
}
