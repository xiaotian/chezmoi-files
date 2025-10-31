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
