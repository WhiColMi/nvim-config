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
        ensure_installed = { "lua_ls", "ts_ls", "biome", "jedi_language_server" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = vim.lsp
      -- lsp.set_log_level("debug")

      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.positionEncodings = { "utf-16" }

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true, noremap = false }

        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      end

      local git_dir = vim.fs.find({ ".git" }, { upward = true })[1]
      local root = git_dir and vim.fs.dirname(git_dir) or vim.fn.getcwd()
      local venv = root .. "/.venv/bin/python"

      local servers = {
        lua_ls = {
          cmd = { "lua-language-server" },
          filetypes = { "lua" },
          root_dir = root,
          settings = {},
        },
        ts_ls = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
          root_dir = root,
          settings = {},
        },
        biome = {
          cmd = { "biome", "lsp" },
          filetypes = { "javascript", "typescript", "css", "json" },
          root_dir = root,
          settings = {},
        },
        dartls = {
          cmd = { "dart", "language-server" },
          filetypes = { "dart" },
          root_dir = root,
          settings = {},
        },
        jedi_language_server = {
          cmd = { "jedi-language-server" },
          filetypes = { "python" },
          root_dir = root,
          settings = {
            jedi = { environment = venv }
          }
        }
      }

      -- Start all servers
      for name, cfg in pairs(servers) do
        cfg.name = name
        cfg.on_attach = on_attach
        cfg.capabilities = capabilities
        lsp.start(cfg)
      end
    end
  },
}
