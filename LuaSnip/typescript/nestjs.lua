local stringz = require("lib/stringz")
return {
  s(
    {
      trig = "nsi",
      dscr = "Nest.js service instantiation",
    },

    fmt([[private readonly {}: {},]], {
      f(function(args)
        return stringz.pascal_to_camel(args[1][1])
      end, { 1 }),
      i(1, "ServiceName"),
    })
  ),
  s(
    "ninject-model",

    fmt(
      [[
@InjectModel({})
private readonly {}Model: Model<{}>,
    ]],
      {
        i(1),
        f(function(args)
          return stringz.pascal_to_camel(args[1][1])
        end, { 1 }),
        i(2, "Database Model ClassName"),
      }
    )
  ),
  s(
    "nget",
    fmt(
      [[
  @Get('{}')
  {}{}({}) {{
    {}
  }}
]],
      {
        i(1),
        c(2, {
          t({ "@UseGuards(JWTAuthGuard)", "" }),
          t(""),
        }),
        i(3),
        i(4),
        i(0),
      }
    )
  ),

  s(
    "nparam",
    fmt(
      [[
export class {}Param {{
  {}
}}
]],
      {
        i(1),
        i(0),
      }
    )
  ),
}
