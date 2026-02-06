return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
        { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        outline_window = {
            split_command = "belowright split",
            focus_on_open = false,
        },
        keymaps = {
            up_and_jump = {},
            down_and_jump = {},
        },
        symbol_folding = {
            -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
            autofold_depth = 4,
            -- When to auto unfold nodes
            auto_unfold = {
                -- Auto unfold currently hovered symbol
                hovered = true,
                -- Auto fold when the root level only has this many nodes.
                -- Set true for 1 node, false for 0.
                only = true,
            },
            markers = { '', '' },
        }, -- Your setup opts here
    },
}
