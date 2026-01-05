return {
    'mrcjkb/rustaceanvim',
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
    init = function()
        -- Configure rustaceanvim before it loads
        vim.g.rustaceanvim = {
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        cargo = {
                            allFeatures = true,
                        },
                    },
                },
            },
        }
    end,
    config = function()
        -- Keymaps for Rust-specific commands
        vim.keymap.set("n", "<leader>dr", function()
            if vim.bo.modified then
                vim.cmd('write')
            end
            vim.cmd('RustLsp debug {args[]}?')
        end, { desc = 'Rust debuggables' })

        vim.keymap.set("n", "<leader>rl", function()
            if vim.bo.modified then
                vim.cmd('write')
            end
            vim.cmd.RustLsp({ 'runnables', bang = true })
        end, { desc = 'Run Last Rust Target' })

        vim.keymap.set("n", "<leader>rt", function()
            if vim.bo.modified then
                vim.cmd('write')
            end
            vim.cmd.RustLsp('runnables')
        end, { desc = 'Select target to run' })
    end
}
