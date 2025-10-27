local ui = require("utils.ui")
vim .diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ui.get_icon 'error',
      [vim.diagnostic.severity.WARN] = ui.get_icon 'warn',
      [vim.diagnostic.severity.HINT] = ui.get_icon 'hint',
      [vim.diagnostic.severity.INFO] = ui.get_icon 'info',
    },
  }
})
