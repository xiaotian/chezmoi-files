return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      gray       = '#3C3C3C',
      teak       = '#D75B7A',
      orange     = '#63B4D6',
      yellow     = '#D79920',
      black      = '#262626',
      white      = '#D4D4D4',
      green      = '#A1D6B2',
      text       = "#E4E4DD",
      text_dark  = "#54622D",
    }

    local theme = {
      normal = {
        b = { fg = colors.green, bg = colors.black },
        a = { fg = colors.text_dark, bg = colors.green, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
      visual = {
        b = { fg = colors.yellow, bg = colors.black },
        a = { fg = colors.text, bg = colors.yellow, gui = 'bold' },
      },
      inactive = {
        b = { fg = colors.black, bg = colors.orange },
        a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
      },
      replace = {
        b = { fg = colors.teak, bg = colors.black },
        a = { fg = colors.text, bg = colors.teak, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
      insert = {
        b = { fg = colors.orange, bg = colors.black },
        a = { fg = colors.text, bg = colors.orange, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
      },
    }
    require('lualine').setup({
      options = { theme = theme }
    })
  end

}
