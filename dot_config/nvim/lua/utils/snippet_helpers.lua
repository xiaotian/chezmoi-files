local ls = require("luasnip")
local s, t, i, f = ls.snippet, ls.text_node, ls.insert_node, ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return { ls = ls, s = s, t = t, i = i, f = f, fmt = fmt }
