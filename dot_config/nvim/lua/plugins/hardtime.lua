return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    enabled = false
  },
  config = function(_, opt)
    require("hardtime").setup(opt)
    vim.keymap.set("n", "<leader>!", "<cmd>Hardtime toggle<cr>", { desc = "Toggle Hardtime" })
  end
}
