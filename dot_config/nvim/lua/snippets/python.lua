local _ = require("utils.snippet_helpers")
local s, i, t = _.s, _.i, _.t

return {
  s("trig", {
    i(1), t "text", i(2), t "text again", i(3)
  }),
  s("main", {
    t({
      "if __name__ == '__main__':",
      "\tmain()"
    })
  })
}
