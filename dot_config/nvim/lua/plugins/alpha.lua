return {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
      local alpha = require('alpha')
      local theta = require('alpha.themes.theta')
      -- vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#798fd2" })
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#186bd8" })
      theta.header.val = {
         [[     ░▒▓▓▓▓░                         ░▒▓▓▓▓░           ░▒▓▓▓▓░     ]],
         [[   ▓▓▓▓▓▓▓▓▓▓▓                     ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓▓▓▓▓▓▓▓▓   ]],
         [[  ▓██▓▓▓▓███▓▓▓                   ▓██▓▓▓▓███▓▓▓     ▓██▓▓▓▓███▓▓▓  ]],
         [[  █▓██▓▓█▓███▓▓                   █▓██▓▓█▓███▓▓     █▓██▓▓█▓███▓▓  ]],
         [[░▓▓███▓▓▓███▓▓▓▓░               ░▓▓███▓▓▓███▓▓▓▓░ ░▓▓███▓▓▓███▓▓▓▓░]],
         [[░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░               ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░ ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░]],
         [[░▓▓░▓▓▓▒░▒▓▓▓▒▓▓░               ░▓▓░▓▓▓▒░▒▓▓▓▒▓▓░ ░▓▓░▓▓▓▒░▒▓▓▓▒▓▓░]],
         [[ ▓   ░▓▒ ░▓▒   ▓                 ▓   ░▓▒ ░▓▒   ▓   ▓   ░▓▒ ░▓▒   ▓ ]],
       }
      theta.header.opts.hl = "AlphaHeader"
      alpha.setup(theta.config)
    end
}
