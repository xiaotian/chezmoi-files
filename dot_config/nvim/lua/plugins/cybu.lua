return {
    "ghillb/cybu.nvim",
    branch = "main",                                                           -- timely updates
    -- branch = "v1.x", -- won't receive breaking changes
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
    lazy = false,
    config = function()
        local ok, cybu = pcall(require, "cybu")
        if not ok then
            return
        end
        cybu.setup({
            display_time = 1000,
            position = {
                -- relative_to = "win", -- win, editor, cursor
                -- anchor = "topcenter", -- topleft, topcenter, topright,
                -- centerleft, center, centerright,
                -- bottomleft, bottomcenter, bottomright
                -- vertical_offset = 10, -- vertical offset from anchor in lines
                -- horizontal_offset = 0, -- vertical offset from anchor in columns
                max_win_height = 10, -- height of cybu window in lines
                max_win_width = 0.5, -- integer for absolute in columns
                -- float for relative to win/editor width
            },
            style = {
                path = "relative", -- absolute, relative, tail (filename only),
                -- tail_dir (filename & parent dir)
                path_abbreviation = "none", -- none, shortened
                border = "rounded", -- single, double, rounded, none
                separator = " ", -- string used as separator
                prefix = "…", -- string used as prefix for truncated paths
                padding = 1, -- left & right padding in number of spaces
                hide_buffer_id = true, -- hide buffer IDs in window
                devicons = {
                    enabled = true, -- enable or disable web dev icons
                    colored = true, -- enable color for web dev icons
                    truncate = true, -- truncate wide icons to one char width
                },
                highlights = { -- see highlights via :highlight
                    current_buffer = "CybuFocus", -- current / selected buffer
                    adjacent_buffers = "CybuAdjacent", -- buffers not in focus
                    background = "CybuBackground", -- window background
                    border = "CybuBorder", -- border of the window
                },
            },
            behavior = {
                mode = {
                    default = {
                        switch = "immediate",
                        view = "rolling",
                    },
                    last_used = {
                        switch = "on_close",
                        -- switch = "immediate",
                        view = "paging",
                        -- view = "rolling",
                        update_on = "buf_enter",
                    },
                    auto = {
                        view = "rolling",
                    },
                },
                show_on_autocmd = false,
            },
        })
        vim.keymap.set("n", "<Tab>", "<Plug>(CybuLastusedNext)")
        vim.keymap.set("n", "<S-Tab>", "<Plug>(CybuLastusedPrev)")
    end,
}
