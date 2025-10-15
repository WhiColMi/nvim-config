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
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true, noremap = true }

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', 'gt', vim.lsp.buf.definition, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      end
      lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
      lspconfig.ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
      lspconfig.biome.setup({ on_attach = on_attach, capabilities = capabilities })
      lspconfig.dartls.setup({ on_attach = on_attach, capabilities = capabilities })
      vim.lsp.set_log_level("debug")
    end
  }

