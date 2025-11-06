
vim.opt.termguicolors = true

vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.opt.wrap = false

-- undo related
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.sidescroll = 1         -- Smooth horizontal scrolling
vim.opt.sidescrolloff = 4      -- Keep 5 columns visible when scrolling horizontally
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.switchbuf = "useopen,uselast"

-- for neovide
if vim.g.neovide then
  vim.opt.guifont = "MesloLGSDZ Nerd Font Mono:h14"
end
