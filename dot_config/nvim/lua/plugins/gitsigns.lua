return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            preview_config = {
                border = 'rounded',
            },
        })


        -- Navigation
        vim.keymap.set('n', ']c', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']c', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end)

        vim.keymap.set('n', '[c', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[c', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
        -- vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis HEAD<CR>", { desc = "Diff" })

        vim.keymap.set("n", "<leader>gD", function()
            gitsigns.diffthis()
        end, { desc = "Diff against staged" })

        vim.keymap.set("n", "<leader>gd", function()
            gitsigns.diffthis('~')
        end, { desc = "Diff against HEAD" })

        vim.keymap.set("n", "<leader>gb", function()
            gitsigns.blame_line({ full = true })
        end, { desc = "Blame Line" })
        vim.keymap.set("n", "<leader>gB", gitsigns.blame, { desc = "Blame File" })
        vim.keymap.set("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })

        vim.keymap.set('n', '<leader>gw', gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })
        vim.keymap.set('n', '<leader>gv', gitsigns.toggle_signs, { desc = "Toggle GitSign Column" })
    end
}
