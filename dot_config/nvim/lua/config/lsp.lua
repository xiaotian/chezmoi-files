-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('ruff')
-- we use rustaceanvim, so don't use this
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('vtsls')
vim.lsp.enable('protobuf')


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
  virtual_text = true, -- False to disable inline virtual text
  float = {
    source = 'if_many',  -- Show source in floating window
    border = 'rounded',
  },
})

-- Show diagnostic in floating window when cursor holds
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end
-- })

vim.keymap.set('n', 'M', function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = 'Show diagnostics' })

-- Hover documentation
vim.keymap.set("n", "K", function() vim.lsp.buf.hover({ border = 'rounded' }) end, { desc = "Hover documentation" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition' })

-- Go to declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- Go to implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Show type definition
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- Show references
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })

-- Rename symbol
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })

-- Signature help (function parameters)
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code action' })
-- Adjust how long before floating window appears
vim.opt.updatetime = 250 -- milliseconds
