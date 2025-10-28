-- keymap
--------------------------------------------------------------------------------

vim.keymap.set('n', '<leader>w', ':set wrap!<CR>', { desc = 'Toggle line wrap' })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Navigate visual lines
vim.keymap.set({ 'n', 'x' }, 'j', 'gj', { desc = 'Navigate down (visual line)' })
vim.keymap.set({ 'n', 'x' }, 'k', 'gk', { desc = 'Navigate up (visual line)' })
vim.keymap.set({ 'n', 'x' }, '<Down>', 'gj', { desc = 'Navigate down (visual line)' })
vim.keymap.set({ 'n', 'x' }, '<Up>', 'gk', { desc = 'Navigate up (visual line)' })
vim.keymap.set('i', '<Down>', '<C-\\><C-o>gj', { desc = 'Navigate down (visual line)' })
vim.keymap.set('i', '<Up>', '<C-\\><C-o>gk', { desc = 'Navigate up (visual line)' })

-- Move current line up/down
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Move selected block up/down in visual mode
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

-- Easier interaction with the system clipboard
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard after the cursor position' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard before the cursor position' })


-- Toggle visible whitespace characters
vim.keymap.set('n', '<leader>l', ':listchars!<CR>', { desc = 'Toggle [l]istchars' })
-- vim.keymap.set('n', '<leader>l', ':set list!<cr>', { desc = 'Toggle [l]istchars' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Lua execution 
vim.keymap.set("n", "<leader>x", function()
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local chunk, err = load(table.concat(lines, "\n"), "buffer", "t")
  if not chunk then
    vim.notify("Error: " .. err, vim.log.levels.ERROR)
    return
  end
  local ok, result = pcall(function()
    -- capture printed output
    local output = {}
    local _print = print
    print = function(...)
      local msg = {}
      for i = 1, select("#", ...) do
        table.insert(msg, tostring(select(i, ...)))
      end
      table.insert(output, table.concat(msg, "\t"))
    end
    chunk()
    print = _print
    return table.concat(output, "\n")
  end)
  if not ok then
    vim.notify("Runtime error: " .. result, vim.log.levels.ERROR)
  else
    vim.notify(result ~= "" and result or "[no output]", vim.log.levels.INFO)
  end
end, { desc = "Run current buffer as Lua" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
