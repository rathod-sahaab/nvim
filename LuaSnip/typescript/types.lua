local stringz = require("lib/stringz")

return {
  s({ trig = "et", dscr = "export type" }, {
    fmt("export type {} = {};", { i(1), i(2) }),
  }),
  s(
    { trig = "unionEnum", dscr = "const array enum" },
    fmt(
      [[
export const {} = [{}] as const;
export type I{} = typeof {}[number];
      ]],
      {
        i(1),
        i(2),
        f(function(args)
          return stringz.snake_to_pascal(args[1][1])
        end, { 1 }),
        rep(1),
      }
    )
  ),
}
