return {
  "rcarriga/nvim-notify",
  config = function()
    -- Set as default notify handler
    require("notify").setup({
      background_colour = "#000000",
      timeout = 3000,
      max_width = 50,
    })
    vim.notify = require("notify")
  end,
}
