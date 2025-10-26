local H = require("utils.snippet_helpers")
local s, f = H.s, H.f

return {
  -- expands 'date' to the current date in YYYY-MM-DD
  s("date", f(function()
    return os.date("%Y-%m-%d")
  end)),
}

