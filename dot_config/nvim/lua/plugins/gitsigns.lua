return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup()
        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", { desc =
        "Toggle current line blame" })
        vim.keymap.set('n', '<leader>vg', ':Gitsigns toggle_signs<CR>', { desc = "Toggle GitSign Column" })
    end
}
