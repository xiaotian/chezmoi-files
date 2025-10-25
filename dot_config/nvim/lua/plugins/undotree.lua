return {
    "mbbill/undotree",
    name = "undotree",
    config = function()
        vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>', { desc = 'Toggle Undotree' })
        -- Enable persistent undo
        vim.opt.undofile = true

        -- Set undo directory
        local undodir = vim.fn.expand('~/.vim/undodir')

        -- Create directory if it doesn't exist
        if vim.fn.isdirectory(undodir) == 0 then
          vim.fn.mkdir(undodir, "p", 0700)
        end

        vim.opt.undodir = undodir
    end
}
