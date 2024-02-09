local k = require("luasnip.nodes.key_indexer").new_key
local stringz = require("lib/stringz")
return {
  s(
    "codeforces",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;

#ifndef LOCAL
#define cerr                                                                   \
  if (false)                                                                   \
  cerr
#endif // DEBUG

using ll = long long;
using ull = unsigned long long;

constexpr const auto newline = "\n";

void solve({}) {{
  {}
}}

int main(int argc, char *argv[]) {{
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  ull t;
  cin >> t;
  while(t--) {{
    {}
    cin >> {};
    solve({});
  }}

  return 0;
}}
]],
      {
        -- i(2),
        d(2, function(args)
          vim.print(args)
          local parts = stringz.split(args[1][1], ",")
          local nodes = {}

          for index, part in ipairs(parts) do
            table.insert(nodes, t(part .. ", "))
            -- table.insert(nodes, fmt("{} " .. part .. ", ", { i(2 + index) }))
          end

          return sn(nil, nodes)
        end, k("solve-passed-params"), { key = "solve-args" }),
        i(0, "", { key = "solve-body" }),
        i(3),
        -- f(function(args)
        --   local parts = stringz.split(args[1][1], ", ")
        --
        --   local nodes = {}
        --   for index, part in ipairs(parts) do
        --     table.insert(nodes, part .. ";\n")
        --   end
        --   return table.concat(nodes)
        -- end, { key_indexer = "solve-args" }, { key = "input-declarations" }),
        i(1, "", { key = "input" }),
        f(function(args)
          vim.print(args)
          local parts = stringz.split(args[1][1]:gsub("%s+", ""), ">>")
          return table.concat(parts, ", ")
        end, k("input"), { "solve-passed-params" }),
      }
    )
  ),
}
