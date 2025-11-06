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
