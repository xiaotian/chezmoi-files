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
        vim.keymap.set("n", "<leader>b", function()
            dap.toggle_breakpoint()
        end, vim.tbl_extend("force", opts, { desc = "Toggle Breakpoint" }))


        -- Continue / Start
        vim.keymap.set("n", "<F5>", function()
            -- load_project_dap()
            dap.continue()
        end, vim.tbl_extend("force", opts, { desc = "Start/Continue" }))

        -- Step Over
        vim.keymap.set("n", "<F10>", function()
            dap.step_over()
        end, vim.tbl_extend("force", opts, { desc = "Step Over" }))

        -- Step Into
        vim.keymap.set("n", "<F11>", function() dap.step_into() end
        , vim.tbl_extend("force", opts, { desc = "Step Into" }))

        -- Step Out
        vim.keymap.set("n", "<F12>", function() dap.step_out() end
        , vim.tbl_extend("force", opts, { desc = "Step Out" }))

        -- Keymap to terminate debugging
        vim.keymap.set("n", "<D-F5>", function()
            dap.terminate()
        end, vim.tbl_extend("force", opts, { desc = "Terminate" }))

        vim.keymap.set("n", "<F6>", function()
            vim.cmd("write")
            local file = vim.fn.expand("%:p")
            vim.cmd("botright new")
            vim.fn.termopen("python3 " .. file)
            vim.cmd("startinsert")
        end, vim.tbl_extend("force", opts, { desc = "Run Python without debugging" }))

        dapui.setup({
            layouts = {
                {
                    elements = {
                        { id = "scopes",      size = 0.25 },
                        { id = "breakpoints", size = 0.25 },
                        { id = "stacks",      size = 0.25 },
                        { id = "watches",     size = 0.25 },
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        { id = "repl",    size = 0.5 },
                        { id = "console", size = 0.5 },
                    },
                    size = 10,
                    position = "bottom",
                },
            },
        })
        -- Toggle DAP UI
        vim.keymap.set("n", "<leader>du", function()
            dapui.toggle({ reset = true })
        end, vim.tbl_extend("force", opts, { desc = "Reset Debugger UI" }))
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
        end
        dap.listeners.before.event_exited.dapui_config = function()
        end
    end
}
