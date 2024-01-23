local function snake_to_camel(input)
  if input == nil then
    return input
  end
  return input:lower():gsub("_%w", function(match)
    return match:sub(2):upper()
  end)
end

local function snake_to_pascal(input)
  if input == nil then
    return input
  end
  local first_letter = input:sub(1, 1):upper()
  return first_letter .. snake_to_camel(input:sub(2))
end

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
          return snake_to_pascal(args[1][1])
        end, { 1 }),
        rep(1),
      }
    )
  ),
}
