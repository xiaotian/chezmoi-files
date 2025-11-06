
-- globals
--------------------------------------------------------------------------------
-- NOTE: Must happen before loading plugins.
--

vim.g.mapleader = " "  -- Sets leader to Space
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.g.pyindent_open_paren = vim.opt.shiftwidth

-- adding a ':Config' command 
vim.api.nvim_create_user_command('Config', 'edit $MYVIMRC', {})

-- neovide stuff 
if vim.g.neovide then
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0.00
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_scroll_animation_far_lines = 0
  vim.g.neovide_scroll_animation_length = 0.00
end
