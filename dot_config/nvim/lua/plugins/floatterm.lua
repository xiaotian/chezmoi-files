return {
  'voldikss/vim-floaterm',
  keys = {
    { '<leader>tt', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal', mode = { 'n' } },
    { '<Esc><Esc>', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal', mode = { 't' } },
    { '<leader>tc', '<cmd>FloatermNew<cr>',    desc = 'New terminal' },
    { '<leader>tk', '<cmd>FloatermKill<cr>',   desc = 'Kill terminal' },
    { '<leader>tp', '<cmd>FloatermPrev<cr>',   desc = 'Previous terminal' },
    { '<leader>tn', '<cmd>FloatermNext<cr>',   desc = 'Next terminal' },

    { '<M-w>', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal', mode = { 't' } },
    { '<M-c>', '<cmd>FloatermNew<cr>',    desc = 'New terminal', mode = { 't' } },
    { '<M-,>', '<cmd>FloatermPrev<cr>',   desc = 'Previous terminal', mode = {'t'}},
    { '<M-.>', '<cmd>FloatermNext<cr>',   desc = 'Next terminal', mode = {'t'}},
  },
  config = function()
    vim.g.floaterm_width = 0.75
    vim.g.floaterm_height = 0.75
    vim.g.floaterm_title = 'Terminal ($1/$2)'
  end
}
