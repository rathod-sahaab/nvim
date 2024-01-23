-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/LuaSnip/" } })
