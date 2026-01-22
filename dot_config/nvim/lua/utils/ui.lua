local M = {}

local icons = {
  error = '', -- ✘
  warn = '',
  hint = '',
  info = '',
}

function M.get_icon(name)
  return icons[name] or '?'
end

local function find_win_by_ft(filetype)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == filetype then
      return win
    end
  end
end

local function close_win(win)
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

function M.toggle_left_sidebar()
  local neo_win = find_win_by_ft("neo-tree")
  local outline_win = find_win_by_ft("Outline")

  if neo_win or outline_win then
    close_win(outline_win)
    close_win(neo_win)
    return
  end

  local current_win = vim.api.nvim_get_current_win()
  vim.cmd("Neotree show left")

  local neo_split = find_win_by_ft("neo-tree")
  if neo_split and vim.api.nvim_win_is_valid(neo_split) then
    vim.api.nvim_set_current_win(neo_split)
    vim.cmd("OutlineOpen!")
  end
  vim.api.nvim_set_current_win(current_win)
end

function M.is_neotree_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    if ft == "neo-tree" then
      return true
    end
  end
  return false
end

return M
