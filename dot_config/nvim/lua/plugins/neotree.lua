return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false,                    -- neo-tree will lazily load itself,
  config = function()
    vim.keymap.set('n', '<leader>n', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
    vim.keymap.set('n', '<leader>.', '<cmd>Neotree reveal reveal_force_cwd<CR>', { desc = 'Reveal current buffer in Neotree' })

    require("neo-tree").setup({
      reveal_force_cwd = true,
      window = {
        width = function()
          local width = math.floor(vim.o.columns * 0.25) -- 25% of screen
          return math.max(10, math.min(width, 60))       -- Between 30 and 50 columns
        end
      },
    })
  end
}
