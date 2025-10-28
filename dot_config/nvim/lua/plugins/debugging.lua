return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require('mason-nvim-dap').setup({
      ensure_installed = { 'codelldb', 'python' },
      automatic_installation = true,
      handlers = {}, -- Use default handlers
    })

    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")
    local dap_vtext = require("nvim-dap-virtual-text")


    dapui.setup({})
    dap_vtext.setup({ commented = true })

    dap_python.setup("python3")
    vim.fn.sign_define("DapBreakpoint", {
      text = "",
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
      text = "", -- or "❌"
      texthl = "DiagnosticSignError",
      linehl = "",
      numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
      text = "", -- or "→"
      texthl = "DiagnosticSignWarn",
      linehl = "Visual",
      numhl = "DiagnosticSignWarn",
    })

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    local opts = { noremap = true, silent = true }

    -- Toggle breakpoint
    vim.keymap.set("n", "<leader>db", function()
      dap.toggle_breakpoint()
    end, opts)

    -- Continue / Start
    vim.keymap.set("n", "<leader>dc", function()
      dap.continue()
    end, opts)

    -- Step Over
    vim.keymap.set("n", "<leader>do", function()
      dap.step_over()
    end, opts)

    -- Step Into
    vim.keymap.set("n", "<leader>di", function()
      dap.step_into()
    end, opts)

    -- Step Out
    vim.keymap.set("n", "<leader>dO", function()
      dap.step_out()
    end, opts)

    -- Keymap to terminate debugging
    vim.keymap.set("n", "<leader>dq", function()
      require("dap").terminate()
    end, opts)


    -- Toggle DAP UI
    vim.keymap.set("n", "<leader>du", function()
      dapui.toggle()
    end, opts)
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
  end
}
