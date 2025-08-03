return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "williamboman/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      
      null_ls.setup({
        sources = {
          formatting.stylua,
          formatting.biome,
        }
      })
      
      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  }
}
