return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  -- build = "make install_jsregexp"
  config = function()
    local ls = require("luasnip")

    -- Path to your snippet folder
    local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"

    -- Load all *.lua files from the folder
    require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })
  end
}
