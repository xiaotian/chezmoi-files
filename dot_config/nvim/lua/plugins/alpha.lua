return {
    'goolord/alpha-nvim',
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()
      local alpha = require('alpha')
      local theta = require('alpha.themes.theta')

      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#414141" })
      theta.header.val = {
         [[                              ░▒▓▓▓▓░           ░▒▓▓▓▓░     ]],
         [[    ▒▓▓▓▓▓▒                 ▓▓▓▓▓▓▓▓▓▓▓       ▓▓▓▓▓▓▓▓▓▓▓   ]],
         [[  ▓▓▓░░░░░░▓▓▓             ▓██▓▓▓▓███▓▓▓     ▓██▓▓▓▓███▓▓▓  ]],
         [[▓▓▓░░░░░░▓▓                █▓██▓▓█▓███▓▓     █▓██▓▓█▓███▓▓  ]],
         [[▓░░░░░░▓▓         ██     ░▓▓███▓▓▓███▓▓▓▓░ ░▓▓███▓▓▓███▓▓▓▓░]],
         [[▓▓▓░░░░░░▓▓              ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░ ░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░]],
         [[  ▓▓▓░░░░░░▓▓▓           ░▓▓░▓▓▓▒░▒▓▓▓▒▓▓░ ░▓▓░▓▓▓▒░▒▓▓▓▒▓▓░]],
         [[    ▒▓▓▓▓▓▒               ▓   ░▓▒ ░▓▒   ▓   ▓   ░▓▒ ░▓▒   ▓ ]],
       }
      theta.header.opts.hl = "AlphaHeader"
      alpha.setup(theta.config)
      vim.keymap.set('n', '<M-0>', ':Alpha<CR>', { desc = 'Go to home screen' })
    end
}
