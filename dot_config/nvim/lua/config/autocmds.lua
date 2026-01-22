-- The following fixes python Enter after open '(', '[', '{' indentation
-- issue.
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.g.pyindent_open_paren = vim.bo.shiftwidth
        vim.bo.indentexpr = "v:lua.MyPythonIndent()"

        if not _G.MyPythonIndent then
            _G.MyPythonIndent = function()
                local lnum = vim.v.lnum
                local line = vim.fn.getline(lnum)

                -- Check if line starts with closing parenthesis
                if line:match("^%s*[%)%}%]]") then
                    local prev_lnum = vim.fn.prevnonblank(lnum - 1)
                    return vim.fn.indent(prev_lnum)
                end

                -- Fall back to default Python indent
                return vim.fn.GetPythonIndent(lnum)
            end
        end
    end,
})

-- disable auto insert comments, very annoying for end of line comments in C/C++, Rust
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

local function set_neotree_statusline_highlights()
    vim.api.nvim_set_hl(0, "NeoTreeStatusLine", { link = "lualine_c_normal" })
    vim.api.nvim_set_hl(0, "NeoTreeStatusLineNC", { link = "lualine_c_inactive" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_neotree_statusline_highlights,
})

set_neotree_statusline_highlights()
