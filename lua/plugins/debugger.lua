--#region
--pip install debugpy
--sudo apt install lldb
--:MasonInstall js-debug-adapter
--#endregion

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "mfussenegger/nvim-dap-python",
      "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -------------------------------------------------------------------
      -- UI SETUP
      -------------------------------------------------------------------
      require("nvim-dap-virtual-text").setup()
      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "scopes",
                size = 0.25
              },
              {
                id = "breakpoints",
                size = 0.25
              },
              {
                id = "stacks",
                size = 0.25
              },
              {
                id = "watches",
                size = 0.25
              }
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "console",
                size = 1
              }
            },
            position = "bottom",
            size = 10,
          }
        },
        controls = {
          enabled = false,
          element = "repl",
        }
      })

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -------------------------------------------------------------------
      -- PYTHON
      -------------------------------------------------------------------
      require("dap-python").setup("python")
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Debug current file (break on error)",
          program = "${file}",
          justMyCode = false,
          console = 'integratedTerminal',
          stopOnEntry = false,
          exceptionalBreakpoints = { "raised", "uncaught" },
        }
      }

      -------------------------------------------------------------------
      -- C / C++
      -------------------------------------------------------------------
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- or "lldb" on macOS
        name = "lldb",
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
      dap.configurations.c = dap.configurations.cpp

      -------------------------------------------------------------------
      -- JAVASCRIPT / TYPESCRIPT
      -------------------------------------------------------------------
      require("dap-vscode-js").setup({
        node_path = "node",
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome" },
      })

      for _, lang in ipairs({ "typescript", "javascript" }) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        }
      end

      -------------------------------------------------------------------
      -- KEYMAPS
      -------------------------------------------------------------------
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<F5>", function() dap.continue() end, opts)
      map("n", "<F10>", function() dap.step_over() end, opts)
      map("n", "<F11>", function() dap.step_into() end, opts)
      map("n", "<F12>", function() dap.step_out() end, opts)
      map("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
      map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
      map("n", "<leader>dr", function() dap.repl.toggle() end, opts)
      map("n", "<leader>dl", function() dap.run_last() end, opts)
      map("n", "<leader>du", function() dapui.toggle() end, opts)

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
    end,
  }
}
