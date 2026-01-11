return {
    'mrcjkb/rustaceanvim',
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    version = '^6', -- Recommended
    lazy = false,   -- This plugin is already lazy
    init = function()
        -- Get Rust toolchain paths for source mapping
        local rust_sysroot = vim.fn.system("rustc --print sysroot"):gsub("%s+", "")
        local rust_hash = vim.fn.system("rustc --version --verbose | grep 'commit-hash' | awk '{print $2}'"):gsub("%s+", "")

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
            dap = {
                configuration = function(adapter)
                    return {
                        name = "Rust Debug",
                        type = "codelldb",
                        request = "launch",
                        initCommands = {
                            -- Source map for Rust stdlib
                            string.format(
                                'settings set target.source-map /rustc/%s "%s/lib/rustlib/src/rust"',
                                rust_hash,
                                rust_sysroot
                            ),
                            -- Disable step filter to allow stepping into std library
                            "settings set target.process.thread.step-avoid-regexp ''",
                            -- Allow stepping into code without debug info
                            "settings set target.process.thread.step-in-avoid-nodebug false",
                        },
                    }
                end,
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

        -- Verify Rust source map configuration
        vim.keymap.set("n", "<leader>dv", function()
            -- Get Rust toolchain paths for source mapping
            local rust_sysroot = vim.fn.system("rustc --print sysroot"):gsub("%s+", "")
            local rust_hash = vim.fn.system("rustc --version --verbose | grep 'commit-hash' | awk '{print $2}'"):gsub("%s+", "")
            print("Rust sysroot: " .. rust_sysroot)
            print("Rust hash: " .. rust_hash)
            print("Source map: /rustc/" .. rust_hash .. " -> " .. rust_sysroot .. "/lib/rustlib/src/rust")
        end, { desc = "Verify Rust source map config" })

    end
}
