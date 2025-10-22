return {
  {
    "mfussenegger/nvim-dap",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      local dap = require("dap")
      dap.setup(opts)

      -- keymaps
      vim.keymap.set("n", "<leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", function()
        dap.continue()
      end, { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dO", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dl", function()
        dap.run_last()
      end, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.run_to_cursorY(1)
      end, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<leader>dt", function()
        dap.terminate()
      end, { desc = "Terminate" })
      vim.keymap.set("n", "<leader>ds", function()
        dap.stop()
      end, { desc = "Stop" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- keymaps
      -- vim.keymap.set("n", "<leader>du", dapui.toggle(), { desc = "Toggle UI" })
    end,
  },
}
