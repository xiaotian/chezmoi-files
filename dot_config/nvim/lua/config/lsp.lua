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
-- vim.lsp.enable('rust-analyzer')
vim.lsp.enable('vtsls')
vim.lsp.enable('protobuf')
vim.lsp.enable('yamlls')
vim.lsp.enable('jsonls')


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
    virtual_text = true,    -- False to disable inline virtual text
    float = {
        source = 'if_many', -- Show source in floating window
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
vim.keymap.set("n", "<leader>ci", function()
    vim.lsp.buf.hover({ border = 'rounded' })
end, { desc = "Hover documentation" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = 'Code action' })
-- Rename symbol
vim.keymap.set("n", "<leader>cc", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>cr", function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients == 0 then
        vim.notify("No LSP clients attached", vim.log.levels.WARN)
        return
    end

    local client_names = {}
    for _, client in ipairs(clients) do
        table.insert(client_names, client.name)
        client:stop()
    end

    vim.notify("Restarting LSP: " .. table.concat(client_names, ", "))

    -- Poll until all clients have fully stopped, then reload the buffer
    -- to re-trigger LSP attachment via vim.lsp.enable() / filetype matching
    local timer = vim.uv.new_timer()
    local attempts = 0
    timer:start(100, 100, vim.schedule_wrap(function()
        attempts = attempts + 1
        local still_running = false
        for _, name in ipairs(client_names) do
            if #vim.lsp.get_clients({ name = name }) > 0 then
                still_running = true
                break
            end
        end
        if not still_running or attempts > 50 then
            timer:stop()
            timer:close()
            vim.cmd('edit')
        end
    end))
end, { desc = "Restart LSP" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Go to definition' })

-- Go to declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })

-- Go to implementation
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })

-- Show type definition
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })

-- Show references
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "List references" })

-- Signature help (function parameters)
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- Custom command to show LSP info
vim.api.nvim_create_user_command('ShowLsp', function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        print("No LSP clients attached to current buffer")
        return
    end

    print("LSP clients attached to current buffer:")
    for _, client in ipairs(clients) do
        print(string.format("  - %s (id: %d)", client.name, client.id))
    end

    print("\nAll active LSP clients:")
    local all_clients = vim.lsp.get_clients()
    for _, client in ipairs(all_clients) do
        print(string.format("  - %s (id: %d)", client.name, client.id))
    end
end, { desc = "Show LSP client information" })
