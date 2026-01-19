return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    enabled = true,
    disable_mouse = false,
    max_time = 2000,
    max_count = 8,
    timeout = 50,
    disabled_keys = {
      ["<Up>"] = {},
      ["<Down>"] = {},
      ["<Left>"] = {},
      ["<Right>"] = {},
    },
  },
  config = function(_, opt)
    require("hardtime").setup(opt)
    vim.keymap.set("n", "<leader>!", "<cmd>Hardtime toggle<cr>", { desc = "Toggle Hardtime" })
  end
}
