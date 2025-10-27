-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.
vim.lsp.enable('lua_ls')
vim.lsp.enable('py_ls')
vim.lsp.enable('rust_ls')
vim.lsp.enable('ts_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = {} -- use blink.cmp { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      -- vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      -- vim.keymap.set('i', '<C-Space>', function()
      --   vim.lsp.completion.get()
      -- end)
    end
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = false,  -- Disable inline virtual text
  float = {
    source = 'always',  -- Show source in floating window
    border = 'rounded',
  },
})

-- Show diagnostic in floating window when cursor holds
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

-- Adjust how long before floating window appears
vim.opt.updatetime = 250  -- milliseconds



