return {
  "XXiaoA/atone.nvim",
  cmd = "Atone",
  opts = {},   -- your configuration here
  config = function()
    vim.keymap.set('n', '<leader>u', '<cmd>Atone toggle<CR><cmd>Atone focus<CR>', { desc = 'Toggle Undotree' })
  end
}
