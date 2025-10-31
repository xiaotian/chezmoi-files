return {
  'voldikss/vim-floaterm',
  keys = {
    { '<leader>tt', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal',  mode = { 'n' } },
    { '<Esc><Esc>', '<cmd>FloatermToggle<cr>', desc = 'Toggle terminal',  mode = { 't' } },
    { '<leader>tn', '<cmd>FloatermNew<cr>',    desc = 'New terminal' },
    { '<leader>tk', '<cmd>FloatermKill<cr>',   desc = 'Kill terminal' },
    { '<leader>tp', '<cmd>FloatermPrev<cr>',   desc = 'Previous terminal' },
    { '<leader>tn', '<cmd>FloatermNext<cr>',   desc = 'Next terminal' },
  },
  config = function()
    vim.g.floaterm_title = 'Terminal ($1/$2)'
  end
}
