return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    -- build = "make install_jsregexp"
    config = function()
        local ls = require("luasnip")

        ls.setup({
            -- Clean up stale snippet sessions when re-entering insert mode
            -- or leaving insert mode. This prevents the super-tab <Tab> mapping
            -- from jumping to old snippet placeholders on unrelated lines.
            region_check_events = "InsertEnter",
            delete_check_events = "InsertLeave",
        })

        -- Path to your snippet folder
        local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"

        -- Load all *.lua files from the folder
        require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
